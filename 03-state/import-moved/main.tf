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
  zone = local.zone
}

locals {
  zone = "ru-central1-a"
}

moved {
  from = yandex_vpc_network.legacy
  to   = yandex_vpc_network.network
}

resource "yandex_vpc_network" "network" {
  folder_id = "b1gehfkioh8aoh8s45av"
  labels = {
    "purpose" = "import-moved"
  }
  name = "tf-import-moved-lab"
}