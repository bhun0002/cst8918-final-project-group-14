variable "resource_prefix" {
  type        = string
  description = "Prefix for resource names"
}
 
variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Resource group for AKS clusters"
}

variable "admin_subnet_id" {
  type        = string
  description = "Subnet ID for test AKS"
}


variable "aks_vm_size" {
  type        = string
  description = "The VM size to be used for AKS node pool"
}

variable "aks_dns_service_ip" {
  type        = string
  description = "The VM DNS service IP"
}

variable "aks_service_cidr" {
  type        = string
  description = "The VM DNS service CIDR"
}

variable "environment" {
  description = "The deployment environment (dev, test, prod)"
  type        = string
}
