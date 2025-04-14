variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_prefix" {
  type        = string
  description = "Prefix for naming ACR, Redis, etc."
}

variable "acr_login_server" {
  type        = string
  description = "Login server for the ACR (e.g. myacr.azurecr.io)"
}

variable "image_tag" {
  type        = string
  description = "Docker image tag to deploy (e.g. commit SHA)"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  
}

variable "image_name" { 
  description = "Name of the Docker image to deploy"
  type        = string
  default     = "weather"
}

variable "environment" {
  description = "The deployment environment name"
  type        = string
}