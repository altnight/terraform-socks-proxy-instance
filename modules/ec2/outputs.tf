output "eip" {
  value = "${aws_eip.eip.public_ip}"
}
output "command(EIP)" {
  value = "ssh ubuntu@${aws_eip.eip.public_ip} -i ${var.ssh_private_key_path} -N -D 8888"
}
output "command(domain)" {
  value = "ssh ubuntu@${aws_route53_record.naked.name} -i ${var.ssh_private_key_path} -N -D 8888"
}

