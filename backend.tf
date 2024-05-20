terraform {
  backend "azurerm" {
    resource_group_name  = "devopstraining12345-cus-rg"
    storage_account_name = "devopstrainingsd12345"
    container_name       = "devopstrainingcon12345"
    key                  = "initial.terraform.tfstate"

  }
}