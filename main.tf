terraform {
  required_version = ">=1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
}

locals {
  tags = {
    "Environment" = var.ennvironment
  }
}

resource "azurerm_storage_account" "storage" {
  public_network_access_enabled = false
  account_tier                  = "Standard"
  name                          = var.storage_account_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  account_replication_type      = var.ennvironment == "Production" ? "GRS" : "LRS"
  tags                          = local.tags
}
