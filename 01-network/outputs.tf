output "network_id" {
  value = yandex_vpc_network.tf-lab-net.id
}
output "subnet_id" {
  value = yandex_vpc_subnet.tf-lab-subnet-a.id
}
