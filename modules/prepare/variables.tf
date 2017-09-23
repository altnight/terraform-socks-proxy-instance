variable "app_name" {
  default = "tf"
}

variable "aws_region" {
  default = "ap-northeast-1"
}
variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

