output "zeppelin_public_ip" {
  value = module.zeppelin.public_ip
}

output "zeppelin_db_user" {
  value = var.zeppelin_name
}

output "zeppelin_db_password" {
  value = var.zeppelin_password
}

output "mds_instance_ip" {
  value =  module.mds-instance.private_ip
}

output "ssh_private_key" {
  value = local.private_key_to_show
  sensitive = true
}
