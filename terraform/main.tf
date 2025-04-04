module "backend" {
  source          = "./backend"
  resource_prefix = var.resource_prefix
  location        = var.location
}