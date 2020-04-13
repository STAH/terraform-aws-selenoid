output add_user {
  value = {
    name                = data.github_user.me.login
    gecos               = data.github_user.me.name
    groups              = ["adm", "wheel"]
    lock_passwd         = true
    sudo                = ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys = data.github_user.me.ssh_keys
  }
}
