provider "azurerm" {
      features {}
}

# 1. Create a resource group
resource "azurerm_resource_group" "rg01" {
  name     = "rg01-b1"
  location = "East US"
  #location = var.region
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.rg01.name
  location            = azurerm_resource_group.rg01.location
  address_space       = ["10.0.0.0/16"]
  tags = {
    "Env": "Dev",
    "project": "p1"
  }
}

/*resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}*/

/*resource "azurerm_subnet" "example" {
  count = length(var.subnet_name)
  name                 = var.subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = [var.subnet_CIDR[count.index]]
}*/



