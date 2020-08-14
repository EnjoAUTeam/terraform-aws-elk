variable "key" {
  description = "Name of the AWS Key Pair to associate with the ELK instance."
}
variable "private_key" {
  description = "Private key to use for ssh functions"
}
variable "CIDR" {
  description = "CIDR blocks for allowed INGRESS"
}
variable "AMI" {
  description = "AMI id"
}
variable "TYPE" {
  description = "Instance Type"
}
variable "availability_zone" {
  description = "Availability Zone"
}
variable "name" {
  description = "Name as set in AWS "
}
variable "logstash_template" {
  description = "Logstash Template file - becomes /etc/logstash/logstash.yml"
}
variable "installation_template" {
  description = "Box Install Template file"
}
variable "kibana_template" {
  description = "Kibana Template file"
}
variable "filebeat_template" {
  description = "FileBeat Template file"
}
variable "beats_template" {
  description = "Beats Template file"
}
variable "es_template" {
  description = "ES Template file"
}
