# AWS ELK Terraform module

Provides ELK stack

```
module "elk" {
  source  = "git::https://github.com/EnjoAUTeam/terraform-aws-elk.git?ref=v1.4"
  key = aws_key_pair.publicaccesskey.id
  private_key = tls_private_key.aws.private_key_pem
  CIDR = concat(var.whitelist, [
    "${aws_instance.backend.private_ip}/32",
    "${aws_instance.frontend.private_ip}/32",
    "${aws_instance.broker.private_ip}/32"
  ])
  AMI = var.elk_ami
  TYPE = var.elk_node_type
  availability_zone = var.aws_zones[0]
  name = "${var.tag_name} - ELK"
  logstash_template = file("configs/logstash.yml")
  installation_template = file("elk.tpl")
  es_template  = data.template_file.es_template.rendered
  beats_template  = file("configs/beats.conf")
  kibana_template = data.template_file.kibana_template.rendered
  filebeat_template = file("configs/elk_filebeat.yml")
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
}
```