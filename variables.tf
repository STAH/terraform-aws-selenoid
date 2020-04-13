variable name {
  default = "selenoid"
}

variable tags {
  default = {}
}

variable instances {
  default = 1
}

# --- EC2

variable ami {
  default = ""
}

variable availability_zone {
  default = null
}

variable placement_group {
  default = null
}

variable tenancy {
  default = null
}

variable host_id {
  default = null
}

variable cpu_core_count {
  default = null
}

variable cpu_threads_per_core {
  default = null
}

variable ebs_optimized {
  default = null
}

variable instance_initiated_shutdown_behavior {
  default = "terminate"
}

variable monitoring {
  default = false
}

variable security_groups {
  default = null
}

variable associate_public_ip_address {
  default = null
}

variable private_ip {
  default = null
}

variable source_dest_check {
  default = true
}

variable iam_instance_profile {
  default = null
}

variable ipv6_address_count {
  default = null
}

variable ipv6_addresses {
  default = null
}

variable hibernation {
  default = false
}

variable volume_type {
  default = "standard"
}

variable volume_size {
  default = 8
}

variable volume_iops {
  default = null
}

variable volume_delete_on_termination {
  default = true
}

variable volume_encrypted {
  default = false
}

variable volume_kms_key_id {
  default = null
}

variable metadata_http_endpoint {
  default = "enabled"
}

variable metadata_http_tokens {
  default = "optional"
}

variable metadata_http_put_response_hop_limit {
  default = 1
}

variable key_name {
  default = null
}

variable instance_type {
  default = "t3.small"
}

variable vpc_security_group_ids {
  default = null
}

variable subnet_id {
  default = null
}

variable cpu_credits {
  default = "standard"
}

variable disable_api_termination {
  default = false
}

# --- Cloud config

variable default_user {}

variable users {
  default = []
}

variable packages {
  default = []
}

variable package_update {
  default = false
}

variable package_upgrade {
  default = true
}

variable runcmd {
  default = []
}

variable write_files {
  default = []
}

# --- Docker

variable install_docker {
  default = true
}

variable add_users_in_docker_group {
  default = []
}

# --- Application

variable cm_selenoid_update_ui {
  default = true
}

variable cm_selenoid_update_args {
  default = ["--vnc"]
}

variable cm_selenoid_update_ui_args {
  default = []
}
