locals {
  path = "/etc/grid-router/quota/test.xml"

  write_files = [{
    path        = local.path,
    owner       = "root:root",
    permissions = "'0644'",
    content     = file("${path.module}/files/quota.xml"),
  }]

  wait_file_provisioned = "while ! test -r ${local.path}; do sleep 3; done"

  runcmd = compact([
    "mkdir -p /etc/grid-router/quota",
    "htpasswd -bc /etc/grid-router/users.htpasswd test test-password",
    local.wait_file_provisioned,
    "docker run -d --name ggr -v /etc/grid-router:/etc/grid-router:ro aerokube/ggr:latest-release",
    "docker run -d --name ggr-ui -p 8888:8888 -v /etc/grid-router:/etc/grid-router/quota:ro aerokube/ggr-ui:latest-release"
  ])
}
