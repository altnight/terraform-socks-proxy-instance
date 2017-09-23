output "connect" {
  value = "mysql -u ${var.aws_rds_username} -p -h ${aws_db_instance.db.address}"
}

