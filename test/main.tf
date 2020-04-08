terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.50"
  }
}

provider aws {
  region = var.region
}

module test {
  source = "../"

  name                   = "testing-terraform-module"
  default_user           = module.provisioner.default_user
  users                  = [module.me.add_user]
  packages               = ["git", "jq"]
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Module    = "selenoid"
    Terraform = "true",
    Testing   = "true",
  }
}

module me {
  source = "./modules/me"
}

module provisioner {
  source  = "4ops/user/null"
  version = "1.0.0"
  name    = "provisioner"
}
