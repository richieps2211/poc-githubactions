# Recurso para generar un nombre aleatorio que será utilizado como nombre del par de claves SSH
resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"      # Prefijo para el nombre aleatorio
  separator = ""         # Sin separador entre el prefijo y el nombre aleatorio
}

# Recurso para generar un par de claves SSH utilizando la API de Azure
resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"  # Tipo de recurso de la API de Azure
  resource_id = azapi_resource.ssh_public_key.id               # ID del recurso SSH público
  action      = "generateKeyPair"                               # Acción para generar un par de claves
  method      = "POST"                                          # Método HTTP para la acción

  # Exporta los valores "publicKey" y "privateKey" de la respuesta de la API
  response_export_values = ["publicKey", "privateKey"]
}

# Recurso para el recurso SSH público en la API de Azure
resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"  # Tipo de recurso de la API de Azure
  name      = random_pet.ssh_key_name.id                     # Nombre generado aleatoriamente para el recurso SSH
  location  = azurerm_resource_group.rg.location             # Ubicación del grupo de recursos
  parent_id = azurerm_resource_group.rg.id                   # ID del grupo de recursos como padre
}

# Output para mostrar la clave pública SSH generada
output "key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey  # Decodifica y muestra la clave pública SSH
}
