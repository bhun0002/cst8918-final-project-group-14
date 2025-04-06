variable "resource_prefix" {
  description = "Prefix for naming resources"
  type        = string
}
 
variable "resource_group_name" {
  description = "Resource group for the ACR"
  type        = string
}
 
variable "location" {
  description = "Azure region"
  type        = string
}