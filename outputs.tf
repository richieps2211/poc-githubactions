# Output para mostrar el nombre del grupo de recursos creado
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# Output para mostrar el nombre del clúster Kubernetes creado
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.k8s.name
}

# Output para mostrar el certificado del cliente del clúster Kubernetes
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive = true
}

# Output para mostrar la clave del cliente del clúster Kubernetes
output "client_key" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
  sensitive = true
}

# Output para mostrar el certificado CA del clúster Kubernetes
output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  sensitive = true
}

# Output para mostrar la contraseña del clúster Kubernetes
output "cluster_password" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].password
  sensitive = true
}

# Output para mostrar el nombre de usuario del clúster Kubernetes
output "cluster_username" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].username
  sensitive = true
}

# Output para mostrar el host del clúster Kubernetes
output "host" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  sensitive = true
}

# Output para mostrar la configuración kubeconfig del clúster Kubernetes
output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}

# resource_group_name:
# Descripción: Este output muestra el nombre del grupo de recursos en Azure donde se desplegó el clúster Kubernetes.
# Valor: azurerm_resource_group.rg.name
# kubernetes_cluster_name:
# Descripción: Este output muestra el nombre del clúster Kubernetes que se creó en Azure.
# Valor: azurerm_kubernetes_cluster.k8s.name
# client_certificate:
# Descripción: Este output muestra el certificado del cliente del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
# Sensible: true (El valor es sensible y se oculta en la salida)
# client_key:
# Descripción: Este output muestra la clave del cliente del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
# Sensible: true
# cluster_ca_certificate:
# Descripción: Este output muestra el certificado CA del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
# Sensible: true
# cluster_password:
# Descripción: Este output muestra la contraseña del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config[0].password
# Sensible: true
# cluster_username:
# Descripción: Este output muestra el nombre de usuario del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config[0].username
# Sensible: true
# host:
# Descripción: Este output muestra el host del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config[0].host
# Sensible: true
# kube_config:
# Descripción: Este output muestra la configuración kubeconfig del clúster Kubernetes.
# Valor: azurerm_kubernetes_cluster.k8s.kube_config_raw
# Sensible: true
