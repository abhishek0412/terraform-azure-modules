# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
}
