# Generate random resource group name

//random_pet.- genera un nombre aleatorio basado en palabras aleatorias para dar nombres unicos a azure
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix //definir el prefijo del nombre aleatorio
}

//azurerm_resource_group.- crea un grupo de recursos en Azure.
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location //especifica la ubicación del grupo de recursos
  name     = random_pet.rg_name.id
}

resource "random_pet" "azurerm_kubernetes_cluster_name" {  //generar un nombre aleatorio que se utilizará como prefijo para el nombre del clúster Kubernetes (AKS) que crearás con Terraform
  prefix = "cluster" //Define el prefijo para el nombre aleatorio. En este caso, el prefijo es "cluster", por lo que el nombre aleatorio generado comenzará con "cluster".
}

resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns" //prefix = "dns": Define el prefijo para el nombre aleatorio. En este caso, el prefijo es "dns", por lo que el nombre aleatorio generado comenzará con "dns".
}

resource "azurerm_kubernetes_cluster" "k8s" {
  # Ubicación del clúster, se obtiene de la ubicación del grupo de recursos
  location            = azurerm_resource_group.rg.location

  # Nombre del clúster, se genera un nombre aleatorio
  name                = random_pet.azurerm_kubernetes_cluster_name.id

  # Nombre del grupo de recursos donde se desplegará el clúster
  resource_group_name = azurerm_resource_group.rg.name

  # Prefijo del DNS para el clúster, se genera un nombre aleatorio
  dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

  # Configuración de identidad del clúster
  identity {
    type = "SystemAssigned"
  }

  # Configuración del pool de nodos por defecto
  default_node_pool {
    name       = "agentpool"                    # Nombre del pool de nodos
    vm_size    = "Standard_D2s_v3"               # Tamaño de las máquinas virtuales de los nodos
    node_count = var.node_count                  # Número de nodos, definido en una variable
  }

  # Perfil de Linux para la configuración del usuario administrador y la clave SSH
linux_profile {
  admin_username = var.username
  ssh_key {
    key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
  }
}



  # Configuración del perfil de red
  network_profile {
    network_plugin    = "kubenet"                 # Plugin de red a utilizar
    load_balancer_sku = "standard"                # SKU del balanceador de carga
  }
}

