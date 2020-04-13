locals {
  path = "/usr/bin/install-docker.sh"

  write_files = var.install_docker != true ? [] : [{
    path        = local.path,
    owner       = "root:root",
    permissions = "'0755'",
    content     = file("${path.module}/files/install-docker.sh"),
  }]

  add_users_runcmd = [for user in var.add_users_in_docker_group : "usermod --append --groups docker ${user}" if user != ""]

  install_docker_runcmd = [
    "while ! test -r ${local.path}; do sleep 3; done",
    "sh ${local.path}",
    "systemctl --no-pager --quiet daemon-reload",
    "systemctl --no-pager --quiet enable docker",
    "systemctl --no-pager --quiet restart docker",
    "rm -f ${local.path}",
  ]

  runcmd = var.install_docker != true ? [] : compact(concat(local.install_docker_runcmd, local.add_users_runcmd))
}
