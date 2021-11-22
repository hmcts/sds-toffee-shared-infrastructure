module "storage_account" {
  count                    = var.env == "stg" ? 1 : 0
  
  source                   = "git@github.com:hmcts/cnp-module-storage-account?ref=master"
  env                      = var.env
  storage_account_name     = "testblobstoragetov2"
  resource_group_name      = azurerm_resource_group.shared_resource_group.name
  location                 = var.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  access_tier              = "Hot"
}
