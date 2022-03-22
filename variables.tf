variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = "selenoid"
}

variable "tags" {
  type    = map
  default = {}
}

variable "instances" {
  type    = number
  default = 1
}

# --- EC2

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "placement_group" {
  description = "The Placement Group to start the instance in"
  type        = string
  default     = null
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  type        = string
  default     = null
}

variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = null
}

variable "cpu_core_count" {
  description = "Sets the number of CPU cores for an instance." # This option is only supported on creation of instance type that support CPU Options https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html#cpu-options-supported-instances-values
  type        = number
  default     = null
}

variable "cpu_threads_per_core" {
  description = "Sets the number of CPU threads per core for an instance (has no effect unless cpu_core_count is also set)."
  type        = number
  default     = null
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instance" # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior
  type        = string
  default     = "terminate"
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "security_groups" {
  default = null
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = null
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet"
  type        = number
  default     = null
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  type        = list(string)
  default     = null
}

variable "hibernation" {
  description = "If true, the launched EC2 instance will support hibernation"
  type        = bool
  default     = false
}

variable "volume_type" {
  description = "?? Volume type"
  type        = string
  default     = "standard"
}

variable "volume_size" {
  description = "?? Volume size"
  type        = number
  default     = 8
}

variable "volume_iops" {
  description = "?? Volume iops"
  type        = number
  default     = null
}

variable "volume_delete_on_termination" {
  description = "?? volume_delete_on_termination"
  type        = bool
  default     = true
}

variable "volume_encrypted" {
  description = "?? volume_encrypted"
  type        = bool
  default     = false
}

variable "volume_kms_key_id" {
  description = "?? volume_kms_key_id"
  type        = string
  default     = null
}

variable "metadata_http_endpoint" {
  description = "?? metadata_http_endpoint"
  type        = string
  default     = "enabled"
}

variable "metadata_http_tokens" {
  description = "?? metadata_http_tokens"
  type        = string
  default     = "optional"
}

variable "metadata_http_put_response_hop_limit" {
  description = "?? metadata_http_put_response_hop_limit"
  type        = number
  default     = 1
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.small"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "cpu_credits" {
  description = "The credit option for CPU usage (unlimited or standard)"
  type        = string
  default     = "standard"
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = false
}

# --- Cloud config

variable "default_user" {
  description = "?? default_user"
  type        = any
}

variable "users" {
  description = "?? users"
  type        = list
  default     = []
}

variable "packages" {
  description = "?? packages"
  type        = list(string)
  default     = []
}

variable "package_update" {
  description = "?? package_update"
  type        = bool
  default     = false
}

variable "package_upgrade" {
  description = "?? package_upgrade"
  type        = bool
  default     = true
}

variable "runcmd" {
  description = "?? runcmd"
  type        = list(string)
  default     = []
}

variable "write_files" {
  description = "?? write_files"
  type        = list(string)
  default     = []
}

# --- Docker

variable "install_docker" {
  description = "?? install_docker"
  type        = bool
  default     = true
}

variable "add_users_in_docker_group" {
  description = "?? add_users_in_docker_group"
  type        = list(string)
  default     = []
}

# --- Application

variable "cm_selenoid_update_ui" {
  description = "?? cm_selenoid_update_ui"
  type        = bool
  default     = true
}

variable "cm_selenoid_update_args" {
  description = "?? cm_selenoid_update_args"
  type        = list(string)
  default     = ["--vnc"]
}

variable "cm_selenoid_update_ui_args" {
  description = "?? cm_selenoid_update_ui_args"
  type        = list(string)
  default     = []
}
