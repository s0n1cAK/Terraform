locals {
  network_name = "${var.project_name}-network-${var.environment}"
}

resource "yandex_vpc_network" "network" {
  name   = local.network_name
  labels = local.labels
}

