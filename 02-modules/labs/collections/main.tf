terraform {
  required_version = "~> 1.15.0"
}


variable "collection" {
  type    = list(string)
  default = ["api", "worker", "monitor", "cache"]
}

resource "terraform_data" "by_key" {
  for_each = toset(var.collection)
  input    = each.value
}

resource "terraform_data" "by_index" {
  count = length(var.collection)
  input = count.index
}