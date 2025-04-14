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

variable "aks_dns_service_ip" {
  type        = string
  description = "The VM DNS service IP"
}

variable "aks_service_cidr" {
  type        = string
  description = "The VM DNS service CIDR"
}

variable "environment" {
  description = "The deployment environment name"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag for the application"
  type        = string
  default     = "latest"
}

variable "acr_login_server" {
  description = "Azure Container Registry login server"
  type        = string
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image to deploy"
  type        = string
  default     = "remix-weather"
}

variable "redis_hostname" {
  description = "Hostname of the Redis cache"
  type        = string
  default     = "redis-cache"
}

