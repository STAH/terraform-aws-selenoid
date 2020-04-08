terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.50"
  }
}

resource aws_instance this {
  count             = var.instances
  ami               = data.aws_ami.latest.id
  tags              = module.tags.tags
  volume_tags       = module.tags.tags
  user_data_base64  = base64gzip(module.cloud_config.content)
  get_password_data = false

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
}

data aws_ami latest {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

module tags {
  source  = "4ops/tags/null"
  version = "1.0.0"

  name        = var.name
  description = var.description
  tags        = var.tags
}

module cloud_config {
  source  = "4ops/cloud-config/null"
  version = "1.0.1"

  default_user = var.default_user
  users        = var.users

  package_update  = true
  package_upgrade = true

  packages = compact(concat([
    "curl",
    "rng-tools",
  ], var.packages))

  write_files = concat([
    {
      path        = "/etc/sysctl.d/99-selenoid.conf",
      owner       = "root:root",
      permissions = "0644",
      content     = file("${path.module}/files/sysctl.conf"),
    },
    {
      path        = "/etc/sudoers.d/wheel",
      owner       = "root:root",
      permissions = "0440",
      content     = "%wheel ALL=(ALL) NOPASSWD:ALL",
    },
    {
      path        = "/etc/ssh/sshd_config",
      owner       = "root:root",
      permissions = "0644",
      content     = file("${path.module}/files/sshd_config"),
    },
  ], var.write_files)

  runcmd = compact(concat([
    "while ! test -r /etc/sysctl.d/99-selenoid.conf; do sleep 3; done",
    "sysctl -p --system",

    "amazon-linux-extras install docker",

    "systemctl --no-pager --quiet daemon-reload",
    "systemctl --no-pager --quiet enable docker rngd",
    "systemctl --no-pager --quiet restart docker rngd sshd",

    "rm -f /etc/update-motd.d/50-amazon-linux-extras-news /etc/update-motd.d/70-available-updates",
    "systemctl --no-pager --quiet restart update-motd",

    "curl -fsSL https://github.com/aerokube/cm/releases/download/${var.config_manager_version}/cm_linux_amd64 -o /usr/bin/cm",
    "chmod 0755 /usr/bin/cm",
    "cm selenoid update --vnc",
    "cm selenoid-ui update",
  ], var.runcmd))
}
