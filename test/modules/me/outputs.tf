output add_user {
  value = {
    name                = data.github_user.me.login
    gecos               = data.github_user.me.name
    groups              = ["adm", "wheel"]
    ssh_authorized_keys = data.github_user.me.ssh_keys
  }
}
