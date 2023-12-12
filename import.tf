import {
  to = azurerm_key_vault_secret.appInsights-InstrumentationKey
  id = "https://applesi-sbox.vault.azure.net/secrets/appInsights-InstrumentationKey/ed572b2081214188a355db89c04ccb2a"
}

import {
  to = azurerm_monitor_diagnostic_setting.kv-ds
  id = "/subscriptions/a8140a9e-f1b0-481f-a4de-09e2ee23f7ab/resourceGroups/apple-shared-infrastructure-sbox/providers/Microsoft.KeyVault/vaults/applesi-sbox|applesi-sbox"
}

import {
  to = azurerm_key_vault_access_policy.creator_access_policy
  id = "/subscriptions/a8140a9e-f1b0-481f-a4de-09e2ee23f7ab/resourceGroups/apple-shared-infrastructure-sbox/providers/Microsoft.KeyVault/vaults/applesi-sbox/objectId/5356a0e7-324e-4efa-970b-4b4aec3f0ba3"
}

import {
  to = azurerm_key_vault_access_policy.product_team_access_policy
  id = "/subscriptions/a8140a9e-f1b0-481f-a4de-09e2ee23f7ab/resourceGroups/apple-shared-infrastructure-sbox/providers/Microsoft.KeyVault/vaults/applesi-sbox/objectId/e7ea2042-4ced-45dd-8ae3-e051c6551789"
}