locals {
  network_name = "${var.project_name}-network"
}

resource "yandex_vpc_network" "network" {
  name   = local.network_name
  labels = local.labels
}

