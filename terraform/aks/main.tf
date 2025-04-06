resource "azurerm_kubernetes_cluster" "test" {
  name                = "${var.resource_prefix}-aks-test"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.resource_prefix}-test"
  kubernetes_version  = var.kubernetes_version
 
  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_B2s"
    vnet_subnet_id  = var.test_subnet_id
  }
 
  identity {
    type = "SystemAssigned"
  }
 
  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.240.0.10"
    service_cidr   = "10.240.0.0/16"
  }
 
  tags = {
    Environment = "test"
  }
}
 
resource "azurerm_kubernetes_cluster" "prod" {
  name                = "${var.resource_prefix}-aks-prod"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.resource_prefix}-prod"
  kubernetes_version  = var.kubernetes_version
 
  default_node_pool {
    name                = "default"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
    vnet_subnet_id      = var.prod_subnet_id
  }
 
  identity {
    type = "SystemAssigned"
  }
 
  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.241.0.10"
    service_cidr   = "10.241.0.0/16"
  }
 
  tags = {
    Environment = "prod"
  }
}