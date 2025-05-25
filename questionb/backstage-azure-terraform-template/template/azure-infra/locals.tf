locals {
  resource_group_parsed_tags = {
    for entry in split(",", "${{ values.resource_group_tags }}") :
    trimspace(split(":", entry)[0]) => trimspace(split(":", entry)[1])
  }

  storage_account_parsed_tags = {
    for entry in split(",", "${{ values.storage_account_tags }}") :
    trimspace(split(":", entry)[0]) => trimspace(split(":", entry)[1])
  }
}

locals {
  sku_parts = split("_", "${{ values.sku }}")
}