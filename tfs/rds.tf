resource "aws_db_subnet_group" "db" {
  name = "${var.app_name}-db-subnet"
  subnet_ids = ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.public-subnet-c.id}"]
  tags {
    Name = "${var.app_name}-db-subnet"
  }
}
resource "aws_db_parameter_group" "db" {
  name   = "${var.app_name}-db-pg"
  family = "mysql5.7"
  tags {
    Name = "${var.app_name}-db-pg"
  }
  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
resource "aws_security_group" "allow_db" {
  name = "allow_db"
  description = "Allow db inbound traffic"
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    protocol = "tcp"
    from_port = 3306
    to_port = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "tcp"
    from_port = 0
    to_port = 65535
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "${var.app_name}-allow_db"
  }
}
resource "aws_db_instance" "db" {
  name = "${var.app_name}_db"
  identifier = "${var.app_name}-db"
  allocated_storage = 5
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7.17"
  instance_class = "db.t2.micro"
  multi_az = false
  username = "${var.aws_rds_username}"
  password = "${var.aws_rds_password}"
  vpc_security_group_ids = ["${aws_security_group.allow_db.id}"]
  publicly_accessible = false
  skip_final_snapshot = true
  db_subnet_group_name = "${aws_db_subnet_group.db.name}"
  parameter_group_name = "${aws_db_parameter_group.db.name}"
}

output "connect" {
  value = "mysql -u ${var.aws_rds_username} -p -h ${aws_db_instance.db.address}"
}
