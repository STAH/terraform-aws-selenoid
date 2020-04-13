terraform {
  required_version = ">= 0.12"

  required_providers {
    aws    = ">= 2.50"
    github = ">= 2.6"
  }
}

provider aws {
  region = var.region
}

module test {
  source = "../"

  name                      = var.name
  default_user              = module.provisioner.default_user
  users                     = [module.me.add_user]
  packages                  = ["git", "jq"]
  subnet_id                 = var.subnet_id
  vpc_security_group_ids    = var.vpc_security_group_ids
  add_users_in_docker_group = [module.me.add_user.name]
  tags                      = module.tags.tags
}

module me {
  source = "./modules/me"
}

module provisioner {
  source   = "4ops/user/aws"
  version  = "1.0.0"
  key_name = var.name
  tags     = module.tags.tags
}

module tags {
  source  = "4ops/tags/null"
  version = "1.0.0"
  name    = var.name
  tags    = var.tags
}
