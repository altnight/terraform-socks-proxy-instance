variable "app_name" {
  default = "tf"
}
variable "app_domain" {}

variable "ssh_private_key_path" {}
variable "ssh_public_key_path" {}

variable "aws_rds_username" {}
variable "aws_rds_password" {}

variable "aws_region" {
  default = "ap-northeast-1"
}
variable "aws_access_key" {}
variable "aws_secret_key" {}
