terraform {
  required_version = "~> 1.15.0"
}


resource "terraform_data" "w1" {
  input = terraform.workspace
}

