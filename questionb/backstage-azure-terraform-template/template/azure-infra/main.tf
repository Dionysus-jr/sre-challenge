resource "azurerm_resource_group" "sre_rg" {
  name     = "${{ values.resource_group_name }}"
  location = "${{ values.region }}"

  tags  = local.resource_group_parsed_tags
}

resource "azurerm_storage_account" "sre_sa" {
  name                     = "${{ values.storage_account_name }}"
  resource_group_name      = azurerm_resource_group.sre_rg.name
  location                 = azurerm_resource_group.sre_rg.location
  account_tier             = local.sku_parts[0]
  account_replication_type = local.sku_parts[1]
  access_tier              = "${{ values.access_tier }}"

  tags  = local.storage_account_parsed_tags
}

resource "azurerm_storage_container" "sre_container" {
  name                  = "${{ values.container_name }}"
  storage_account_name  = azurerm_storage_account.sre_sa.name #deprecated https://registry.terraform.io/providers/hashicorp/azurerm/4.25.0/docs/resources/storage_container
  container_access_type = "${{ values.container_access_type }}"
}