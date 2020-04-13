locals {
  path = "/usr/bin/update-cm.sh"

  write_files = [{
    path        = local.path,
    owner       = "root:root",
    permissions = "'0755'",
    content     = file("${path.module}/files/update-cm.sh"),
  }]

  wait_file_provisioned = "while ! test -r ${local.path}; do sleep 3; done"
  update_cm             = "sh ${local.path}"
  cm_selenoid_update    = "cm selenoid update ${join(" ", var.cm_selenoid_update_args)}"
  cm_selenoid_update_ui = var.cm_selenoid_update_ui != true ? "" : "cm selenoid-ui update ${join(" ", var.cm_selenoid_update_ui_args)}"

  runcmd = compact([
    local.wait_file_provisioned,
    local.update_cm,
    local.cm_selenoid_update,
    local.cm_selenoid_update_ui,
  ])
}
