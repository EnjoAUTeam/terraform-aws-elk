output "public_ip" {
  value       = aws_instance.elk.public_ip
  description = "Public IP. Can chnage. Prefer to use DNS"
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
output "instance_id" {
  value       = aws_instance.elk.id
  description = "ELK Ec2 Instance ID"
}
output "vpc_id" {
  value       = var.vpc_id
  description = "VPC this is attached to"
}
output "subnet_id" {
  value       = var.subnet_id
  description = "SUBNET this is attached to"
}