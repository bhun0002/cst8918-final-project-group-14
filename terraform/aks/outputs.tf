output "test_cluster_name" {
  value = azurerm_kubernetes_cluster.test.name
}
 
output "prod_cluster_name" {
  value = azurerm_kubernetes_cluster.prod.name
}