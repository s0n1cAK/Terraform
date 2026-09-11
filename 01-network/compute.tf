data "yandex_compute_image" "vm_image" {
  family = var.image_family
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  labels = {
    project     = "tf-gitops-lab"
    environment = "dev"
    component   = "compute"
  }

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      name     = "disk-name"
      type     = "network-hdd"
      image_id = data.yandex_compute_image.vm_image.id
      size     = max(10, data.yandex_compute_image.vm_image.min_disk_size)
    }
    auto_delete = true
  }

  network_interface {
    index     = 0
    subnet_id = yandex_vpc_subnet.tf-lab-subnet-a.id
    nat       = false
  }
}
