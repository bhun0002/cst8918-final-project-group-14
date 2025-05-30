output "resource_group_name" {
  value = azurerm_resource_group.network_rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.main_vnet.name
}

output "subnet_ids" {
  value = [
    azurerm_subnet.admin.id,
    azurerm_subnet.test.id,
    azurerm_subnet.dev.id,
    azurerm_subnet.prod.id
  ]
}