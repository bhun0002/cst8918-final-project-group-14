provider "azurerm" {
  features {}
}

# Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = "${var.resource_prefix}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}


# Redis Cache
resource "azurerm_redis_cache" "redis" {
  name                = "${var.resource_prefix}-redis-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  non_ssl_port_enabled = true
  minimum_tls_version = "1.2"

  tags = {
    Environment = var.environment
  }
}

# Remix App Deployment
resource "kubernetes_deployment" "remix_app" {
  metadata {
    name = "remix-weather"
    labels = {
      app = "remix-weather"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "remix-weather"
      }
    }

    template {
      metadata {
        labels = {
          app = "remix-weather"
        }
      }

      spec {
        container {
          name  = "remix-weather"
          image = "${var.acr_login_server}/${var.image_name}:${var.image_tag}"
          image_pull_policy = "Always"

          port {
            container_port = 8080   # 🟢 runs on 8080 internally
          }

          env {
            name  = "REDIS_URL"
            value = "rediss://${azurerm_redis_cache.redis.hostname}:6380"
          }

          env {
            name  = "REDIS_PASSWORD"
            value = azurerm_redis_cache.redis.primary_access_key
          }

          env {
            name  = "WEATHER_API_KEY"
            value = var.weather_api_key
          }
        }
      }
    }
  }
}

# Kubernetes Service to expose app
resource "kubernetes_service" "remix_service" {
  metadata {
    name = "remix-weather-service"
    labels = {
      app = "remix-weather"
    }
  }

  spec {
    selector = {
      app = "remix-weather"
    }

    port {
      port        = 80          # 🌐 exposed to the internet
      target_port = 8080        # 🟢 maps to app port inside container
    }

    type = "LoadBalancer"
  }
}