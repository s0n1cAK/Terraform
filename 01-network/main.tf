terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.226.0"
    }
  }
  required_version = "~> 1.15.0"
}

provider "yandex" {
  zone = "ru-central1-a"
}

resource "yandex_vpc_network" "tf-lab-net" {
  name = "tf-lab-net"
  labels = {
    project     = "tf-gitops-lab"
    environment = "dev"
  }
}

resource "yandex_vpc_subnet" "tf-lab-subnet-a" {
  name           = "tf-lab-subnet-a"
  v4_cidr_blocks = ["10.77.0.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.tf-lab-net.id
  labels = {
    project     = "tf-gitops-lab"
    environment = "dev"
  }
}
