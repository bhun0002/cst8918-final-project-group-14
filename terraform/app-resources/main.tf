resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = var.aks_principal_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}

resource "kubernetes_namespace" "weather" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "weather_app" {
  metadata {
    name      = "weather-app"
    namespace = kubernetes_namespace.weather.metadata[0].name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "weather"
      }
    }
    template {
      metadata {
        labels = {
          app = "weather"
        }
      }
      spec {
        container {
          name  = "weather"
          image = "${var.acr_login_server}/weather-app:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "weather_app" {
  metadata {
    name      = "weather-app-service"
    namespace = kubernetes_namespace.weather.metadata[0].name
  }
  spec {
    selector = {
      app = "weather"
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 80
    }
  }
}
