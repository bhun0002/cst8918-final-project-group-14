provider "kubernetes" {
  host                   = module.aks.kube_config["host"]
  client_certificate     = base64decode(module.aks.kube_config["client_certificate"])
  client_key             = base64decode(module.aks.kube_config["client_key"])
  cluster_ca_certificate = base64decode(module.aks.kube_config["cluster_ca_certificate"])
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

module "app" {
  source              = "../../app-resources"
  resource_group_name = module.network.resource_group_name
  location            = var.location
  resource_prefix     = var.resource_prefix
  acr_name            = var.acr_name
  acr_login_server    = var.acr_login_server
  image_name          = var.image_name
  image_tag           = var.image_tag
  weather_api_key     = var.weather_api_key
  environment         = var.environment

  providers = {
    kubernetes = kubernetes
  }
}

