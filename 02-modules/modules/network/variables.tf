
locals {
  environments = ["dev", "staging", "prod"]

  init_labels = {
    "module" = "network"
    }
  labels = merge(local.init_labels, var.additional_labels)
}

variable "environment" {
  type    = string
  
  validation {
    condition     = contains(local.environments, var.environment)
    error_message = "The environment must be in dev/staging/prod."
  }
}

variable "zone" {
  type    = string
}

variable "project_name" {
  type    = string
}


variable "cidr_blocks" {
  type    = list(string)
}

variable "additional_labels" {
  type = map(string)
}
