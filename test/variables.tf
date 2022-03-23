variable "region" {
  default = "eu-west-1"
}
variable "subnet_id" {
  default = "subnet-63a94d1a"
}
variable "vpc_security_group_ids" {
  default = ["sg-03de2a80ba237ba56"]
}

variable "ami" {
  default = "ami-015afd151917a362d" # Ubuntu 20.04
}

variable "name" {
  default = "testing-selenoid"
}

variable "default_user" {
  default = {
    name                = "corelia"
    gecos               = "Corelia Admin"
    groups              = ["adm", "wheel"]
    lock_passwd         = true
    sudo                = ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys = ["CORELIA"] # data.github_user.me.ssh_keys
  }
}

variable "tags" {
  default = {
    Module    = "selenoid"
    Terraform = "true",
    Testing   = "true",
  }
}
