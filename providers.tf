# Configuración del bloque Terraform
terraform {
  # Versión mínima requerida de Terraform
  required_version = ">=1.0"

  # Proveedores requeridos y sus versiones
  required_providers {
    # Proveedor para Azure API
    azapi = {
      source  = "azure/azapi"   # Origen del proveedor
      version = "~>1.5"         # Versión del proveedor
    }
    # Proveedor para recursos de Azure
    azurerm = {
      source  = "hashicorp/azurerm"  # Origen del proveedor
      version = "~>3.0"               # Versión del proveedor
    }
    # Proveedor para generar valores aleatorios
    random = {
      source  = "hashicorp/random"  # Origen del proveedor
      version = "~>3.0"             # Versión del proveedor
    }
    # Proveedor para funciones relacionadas con el tiempo
    time = {
      source  = "hashicorp/time"   # Origen del proveedor
      version = "0.9.1"            # Versión del proveedor
    }
  }

  # Configuración del backend remoto
  cloud {
    organization = "richie-terraform"

    workspaces {
      name = "ghactions-aks"
    }
  }
}

# Configuración del proveedor azurerm (Azure Resource Manager)
provider "azurerm" {
  features {}  # Habilita las características adicionales del proveedor
}
