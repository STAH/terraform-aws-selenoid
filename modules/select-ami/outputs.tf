output "id" {
  value = var.id != "" ? var.id : data.aws_ami.latest.id
}
