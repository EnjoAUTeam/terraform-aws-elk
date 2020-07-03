output "kibana_url" {
  value       = "http://${aws_eip.ip.public_ip}:5601"
  description = "URL to your ELK server's Kibana web page"
}
output "public_ip" {
  value       = aws_eip.ip.public_ip
  description = "URL to your ELK server's Kibana web page"
}
