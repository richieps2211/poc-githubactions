# Variable para la ubicación del grupo de recursos en Azure
variable "resource_group_location" {
  type        = string        # Tipo de la variable: string
  default     = "eastus"      # Valor por defecto: "eastus"
  description = "Location of the resource group."  # Descripción de la variable
}

# Variable para el prefijo del nombre del grupo de recursos
variable "resource_group_name_prefix" {
  type        = string                     # Tipo de la variable: string
  default     = "rg"                       # Valor por defecto: "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."  # Descripción de la variable
}

# Variable para la cantidad inicial de nodos en el nodo del clúster
variable "node_count" {
  type        = number                     # Tipo de la variable: number
  description = "The initial quantity of nodes for the node pool."  # Descripción de la variable
  default     = 2                          # Valor por defecto: 2
}

# Variable para el ID de la Identidad de Servicio Administrado (Managed Service Identity)
variable "msi_id" {
  type        = string                     # Tipo de la variable: string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."  # Descripción de la variable
  default     = null                       # Valor por defecto: null
}

# Variable para el nombre de usuario administrador del clúster
variable "username" {
  type        = string                     # Tipo de la variable: string
  description = "The admin username for the new cluster."  # Descripción de la variable
  default     = "azureadmin"               # Valor por defecto: "azureadmin"
}
