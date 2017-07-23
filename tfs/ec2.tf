resource "aws_key_pair" "key_pair" {
  key_name = "${var.app_name}-keypair"
  public_key = "${file(var.ssh_public_key_path)}"
}

data "aws_ami" "ubuntu-1604" {
  most_recent = true
  owners = ["099720109477"] # Canonical
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "tcp"
    from_port = 0
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}-allow_ssh"
  }
}
resource "aws_instance" "web" {
  ami = "${data.aws_ami.ubuntu-1604.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  key_name = "${aws_key_pair.key_pair.key_name}"
  subnet_id = "${aws_subnet.public-subnet-a.id}"
  tags {
    Name = "${var.app_name}-web"
  }
}
resource "aws_eip" "eip" {
  vpc = true
  instance = "${aws_instance.web.id}"
}

output "eip" {
  value = "${aws_eip.eip.public_ip}"
}
output "command" {
  value = "ssh ubuntu@${aws_eip.eip.public_ip} -i ${var.ssh_private_key_path} -N -D 8888"
}
