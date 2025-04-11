variable "acr_id" {
  type        = string
  description = "The Azure Container Registry ID"
}

variable "aks_principal_id" {
  type        = string
  description = "The managed identity object ID of the AKS cluster"
}

variable "namespace" {
  type        = string
  default     = "weather"
  description = "Namespace in Kubernetes where the app will be deployed"
}

variable "acr_login_server" {
  description = "ACR login server URL"
}