resource "azurerm_resource_group" "network-Rg" {
  name     = var.network-Rg
  location = var.location
}

resource "azurerm_resource_group" "linux-Rg" {
  name     = var.linux-Rg
  location = var.location
}

resource "azurerm_resource_group" "windows-Rg" {
  name     = var.windows-Rg
  location = var.location
}
