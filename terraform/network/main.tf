resource "azurerm_resource_group" "network_rg" {
  name     = "${var.resource_prefix}-network-rg"
  location = var.location
}

resource "azurerm_virtual_network" "main_vnet" {
  name                = "${var.resource_prefix}-vnet"
  address_space       = ["10.0.0.0/14"]
  location            = azurerm_resource_group.network_rg.location
  resource_group_name = azurerm_resource_group.network_rg.name
}

resource "azurerm_subnet" "admin" {
  name                 = "admin-subnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "test" {
  name                 = "test-subnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "dev" {
  name                 = "dev-subnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "prod" {
  name                 = "prod-subnet"
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = ["10.3.0.0/16"]
}