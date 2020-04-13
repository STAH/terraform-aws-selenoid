terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.50"
  }
}

resource aws_instance this {
  count                                = var.instances
  ami                                  = module.select_ami.id
  tags                                 = module.tags.tags
  volume_tags                          = module.tags.tags
  user_data_base64                     = base64gzip(module.cloud_config.content)
  get_password_data                    = false
  availability_zone                    = var.availability_zone
  placement_group                      = var.placement_group
  tenancy                              = var.tenancy
  host_id                              = var.host_id
  cpu_core_count                       = var.cpu_core_count
  cpu_threads_per_core                 = var.cpu_threads_per_core
  ebs_optimized                        = var.ebs_optimized
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  monitoring                           = var.monitoring
  security_groups                      = var.security_groups
  vpc_security_group_ids               = var.vpc_security_group_ids
  subnet_id                            = var.subnet_id
  associate_public_ip_address          = var.associate_public_ip_address
  private_ip                           = var.private_ip
  source_dest_check                    = var.source_dest_check
  iam_instance_profile                 = var.iam_instance_profile
  ipv6_address_count                   = var.ipv6_address_count
  ipv6_addresses                       = var.ipv6_addresses
  hibernation                          = var.hibernation
  disable_api_termination              = var.disable_api_termination

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    iops                  = var.volume_iops
    encrypted             = var.volume_encrypted
    kms_key_id            = var.volume_kms_key_id
    delete_on_termination = var.volume_delete_on_termination
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
  }

  lifecycle {
    ignore_changes = [ami]
  }
}

module tags {
  source  = "4ops/tags/null"
  version = "1.0.0"
  name    = var.name
  tags    = var.tags
}

module select_ami {
  source = "./modules/select-ami"
  id     = var.ami
}

module install_docker {
  source                    = "./modules/install-docker"
  install_docker            = var.install_docker
  add_users_in_docker_group = var.add_users_in_docker_group
}

module install_selenoid {
  source                     = "./modules/install-selenoid"
  cm_selenoid_update_ui      = var.cm_selenoid_update_ui
  cm_selenoid_update_args    = var.cm_selenoid_update_args
  cm_selenoid_update_ui_args = var.cm_selenoid_update_ui_args
}

module cloud_config {
  source  = "4ops/cloud-config/null"
  version = "1.0.1"

  default_user    = var.default_user
  users           = var.users
  package_update  = var.package_update
  package_upgrade = var.package_upgrade
  packages        = var.packages

  write_files = concat(
    module.install_docker.write_files,
    module.install_selenoid.write_files,
    var.write_files
  )

  runcmd = compact(concat(
    module.install_docker.runcmd,
    module.install_selenoid.runcmd,
    var.runcmd
  ))

  final_message = "Selenoid installation finished"
}
