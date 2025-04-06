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
 
variable "prod_subnet_id" {
  type        = string
  description = "Subnet ID for prod AKS"
}
 
variable "test_subnet_id" {
  type        = string
  description = "Subnet ID for test AKS"
}
 
variable "kubernetes_version" {
  type        = string
  description = "AKS Kubernetes version"
  default     = "1.32.0"
}