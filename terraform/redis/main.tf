resource "azurerm_redis_cache" "weather" {
  name                = "${var.resource_prefix}-redis-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  non_ssl_port_enabled = true

  tags = {
    Environment = var.environment
  }
}
