locals {
  subnet_name = "${var.project_name}-subnet-${var.environment}"
}

resource "yandex_vpc_subnet" "subnet" {
  v4_cidr_blocks = var.cidr_blocks
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  labels         = local.labels
  name           = local.subnet_name

}
