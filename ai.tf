data "azurerm_subnet" "iaas_subnet" {
  name                 = "iaas"
  resource_group_name  = "ss-${var.env}-network-rg"
  virtual_network_name = "ss-${var.env}-vnet"
}

module "ai" {
  count                        = var.env == "sbox" ? 1 : 0
  source                       = "git@github.com:hmcts/terraform-module-ai-services?ref=DTSPO-30612/optional-networking"
  env                          = var.env
  project                      = "${var.project}-${var.product}"
  existing_resource_group_name = azurerm_resource_group.shared_resource_group.name
  common_tags                  = var.common_tags
  product                      = var.project
  component                    = var.product
  key_vault_id                 = module.vault.key_vault_id
  application_insights_id      = module.application_insights.id
  create_cognitive_account     = true
  cognitive_account_kind       = "SpeechServices"
  cognitive_account_sku        = "S0"
  subnet_id                    = data.azurerm_subnet.iaas_subnet.id
  enable_managed_network       = true
}