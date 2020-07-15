output "public_ip" {
  value       = aws_eip.ip.public_ip
  description = "Public IP. Can chancge. Pefer to use DNS"
}
output "public_dns" {
  value       = aws_instance.elk.public_dns
  description = "PublicDNS, should be used as CNAME"
}
output "private_dns" {
  value       = aws_instance.elk.private_dns
  description = "private DNS. Should be used in CNAME"
}
output "private_ip" {
  value       = aws_instance.elk.private_ip
  description = "Subject to change. Prefer to use DNS."
}