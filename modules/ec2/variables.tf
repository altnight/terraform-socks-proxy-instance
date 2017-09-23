variable "vpc_id" {}
variable "vpc_subnet_id" {}

variable "app_name" {
  default = "tf"
}
variable "app_domain" {}

variable "ssh_private_key_path" {}
variable "ssh_public_key_path" {}
