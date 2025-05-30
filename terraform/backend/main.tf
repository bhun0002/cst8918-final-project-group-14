resource "azurerm_resource_group" "tfstate_rg" {
  name     = "${var.resource_prefix}-tfstate-rg"
  location = var.location
}

resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "${var.resource_prefix}tfstate"
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate_sa.name
  container_access_type = "private"
}