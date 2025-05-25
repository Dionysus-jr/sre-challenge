## Terraform Azure Infra

This repo contains Terraform config to deploy:
- Resource Group: `${{ values.resource_group_name }}`
- Storage Account: `${{ values.storage_account_name }}`
- Container: `${{ values.container_name }}`

### How to use
```sh
terraform init
terraform validate
terraform plan
terraform apply
