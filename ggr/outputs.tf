output "id" {
  value = aws_instance.this.*.id
}

output "arn" {
  value = aws_instance.this.*.arn
}

output "public_dns" {
  value = aws_instance.this.*.public_dns
}

output "public_ip" {
  value = aws_instance.this.*.public_ip
}

output "ipv6_addresses" {
  value = aws_instance.this.*.ipv6_addresses
}

output "private_dns" {
  value = aws_instance.this.*.private_dns
}

output "private_ip" {
  value = aws_instance.this.*.private_ip
}

output "instance_state" {
  value = aws_instance.this.*.instance_state
}
