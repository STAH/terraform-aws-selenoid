variable "install_docker" {
  description = "?? install_docker"
  type = bool
  default = true
}

variable "add_users_in_docker_group" {
  description = "?? add_users_in_docker_group"
  type = list(string)
  default = []
}
