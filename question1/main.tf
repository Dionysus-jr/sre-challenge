resource "azurerm_resource_group" "sre_rg" {
  name     = var.resource_group_name
  location = var.region

  tags = var.tags
}

resource "azurerm_storage_account" "sre_sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.sre_rg.name
  location                 = azurerm_resource_group.sre_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  access_tier              = var.access_tier

  tags = var.tags
}

resource "azurerm_storage_container" "sre_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sre_sa.name #deprecated https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/resources/storage_container
  container_access_type = var.container_access_type
}