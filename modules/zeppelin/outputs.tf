output "id" {
  value = oci_core_instance.Zeppelin.*.id
}

output "public_ip" {
  value = join(", ", oci_core_instance.Zeppelin.*.public_ip)
}

output "zeppelin_user_name" {
  value = var.zeppelin_name
}

output "zeppelin_host_name" {
  value = oci_core_instance.Zeppelin.*.display_name
}
