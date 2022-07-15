
output "zone" {
  value = yandex_vpc_subnet.default.zone
}


output "s_id" {
  value = yandex_vpc_subnet.default.id
}

output "internal_ip_address_clickhouse_yandex_cloud" {
  value = yandex_compute_instance.clickhouse.network_interface.0.ip_address
}


output "external_ip_address_clickhouse-01_yandex_cloud" {
  value = yandex_compute_instance.clickhouse.network_interface.0.nat_ip_address
}




output "tf_workspace" {
  value = "${terraform.workspace}"
}
