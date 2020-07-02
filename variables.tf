variable "key" {
  description = "Name of the AWS Key Pair to associate with the ELK instance."
}
variable "private_key" {
  description = "Private key to use for ssh functions"
}
variable "CIDR" {
  description = "CIDR blocks for allowed INGRESS"
}