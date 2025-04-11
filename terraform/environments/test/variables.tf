variable "resource_prefix" {
  type        = string
  description = "Prefix for all resource names"
}

variable "location" {
  type        = string
  description = "Azure region to deploy to"
}

variable "aks_vm_size" {
  type        = string
  description = "The VM size for AKS default node pool"
}

variable "environment" {
  description = "The deployment environment name"
  type        = string
}


