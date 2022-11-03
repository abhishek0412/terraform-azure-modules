# Create storage account for boot diagnostics
resource "azurerm_storage_account" "storageacc1" {
  name                     = "cadevopsstorageacc1"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storagecontainer1" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.storageacc1.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "mystorageblob" {
  name = "sample.vhd"

  storage_account_name   = azurerm_storage_account.storageacc1.name
  storage_container_name = azurerm_storage_container.storagecontainer1.name

  type = "Page"
  size = 5120
}
