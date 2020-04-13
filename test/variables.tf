variable region {}
variable subnet_id {}
variable vpc_security_group_ids {}

variable name {
  default = "testing-terraform-module-selenoid"
}

variable tags {
  default = {
    Module    = "selenoid"
    Terraform = "true",
    Testing   = "true",
  }
}
