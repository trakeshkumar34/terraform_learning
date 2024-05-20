data "azurerm_resource_group" "main" {
  name = format("%s-%s-rg", var.project_name, var.project_region_short_name)
}