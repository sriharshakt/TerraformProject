variable "region" {}

variable "environment" {}

//Networking
variable "vpc_cidr" {}

variable "public_subnets_cidr" {
  type        = list
  }

variable "private_subnets_cidr" {
  type        = list
}
