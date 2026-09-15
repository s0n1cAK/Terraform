terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.226.0"
    }
  }
  required_version = "~> 1.15.0"
}

locals {
  zone        = "ru-central1-a"
  env         = "prod"
  cidr_blocks = ["10.79.0.0/24"]
}



provider "yandex" {
  zone = local.zone
}


module "network" {
  source = "../../modules/network"

  project_name      = "tfModules"
  zone              = local.zone
  environment       = local.env
  cidr_blocks       = local.cidr_blocks
  additional_labels = {}
}