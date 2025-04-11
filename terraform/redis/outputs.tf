output "redis_hostname" {
  value = azurerm_redis_cache.weather.hostname
}

output "redis_primary_key" {
  value     = azurerm_redis_cache.weather.primary_access_key
  sensitive = true
}
