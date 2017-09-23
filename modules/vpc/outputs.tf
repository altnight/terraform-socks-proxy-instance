output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
output "vpc_subnet_id" {
  value = "${aws_subnet.public-subnet-a.id}"
}
output "vpc_subnet_id_a" {
  value = "${aws_subnet.public-subnet-a.id}"
}
output "vpc_subnet_id_c" {
  value = "${aws_subnet.public-subnet-c.id}"
}
