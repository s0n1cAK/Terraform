output "name_workspace" {
  value = terraform.workspace
}

output "id_resource" {
  value = terraform_data.w1.id
}
