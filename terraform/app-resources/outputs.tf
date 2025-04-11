output "namespace_name" {
  value = kubernetes_namespace.app_namespace.metadata[0].name
}
