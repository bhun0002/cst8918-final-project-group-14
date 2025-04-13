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
  aks_service_cidr    = var.aks_service_cidr
  aks_dns_service_ip  = var.aks_dns_service_ip
  environment         = var.environment
}
 
module "acr" {
  source              = "../../acr"
  resource_prefix     = var.resource_prefix
  location            = var.location
  resource_group_name = module.network.resource_group_name
}

module "redis" {
  source              = "../../redis"
  resource_prefix     = var.resource_prefix
  location            = var.location
  resource_group_name = module.network.resource_group_name
  environment         = var.environment
}

