output "network_id" {
  value = yandex_vpc_network.tf-lab-net.id
}
output "subnet_id" {
  value = yandex_vpc_subnet.tf-lab-subnet-a.id
}

output "vm_id" {
  value = yandex_compute_instance.vm.id
}

output "vm_internal_ip" {
  value = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "image_id" {
  value = data.yandex_compute_image.vm_image.id
}
