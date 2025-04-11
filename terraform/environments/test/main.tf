module "backend" {
  source          = "../../backend"
  resource_prefix = var.resource_prefix
  location        = var.location
}

module "network" {
  source          = "../../network"
  resource_prefix = var.resource_prefix
  location        = var.location
}

module "aks" {
  source              = "../../aks"
  resource_prefix     = var.resource_prefix
  location            = var.location
  resource_group_name = module.network.resource_group_name
  admin_subnet_id     = module.network.subnet_ids[0]
  aks_vm_size         = var.aks_vm_size
}
 
module "acr" {
  source              = "../../acr"
  resource_prefix     = var.resource_prefix
  location            = var.location
  resource_group_name = module.network.resource_group_name
}