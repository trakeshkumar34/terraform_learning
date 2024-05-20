##virtual network###
resource "azurerm_virtual_network" "main" {
  name                = format("%s-%s-vnet", var.project_name, var.project_region_short_name)
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  address_space       = var.vnet_address_space
  tags                = merge(local.common_tag, { "name" = format("%s-%s-rg", var.project_name, var.project_region_short_name) })
}


##subnet####
resource "azurerm_subnet" "snet" {
  count                = length(var.webapp_subnets)
  name                 = format("%s-%s-%s-snet", var.project_name, var.webapp_subnets[count.index], var.project_region_short_name)
  resource_group_name  = data.azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [element(var.snet_address_prefixes, count.index)]
}

##nsg####
resource "azurerm_network_security_group" "nsg" {
  name                = format("%s-%s-nsg", var.project_name, var.project_region_short_name)
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = merge(local.common_tag, { "name" = format("%s-%s-rg", var.project_name, var.project_region_short_name) })
}

##nsg rules####
resource "azurerm_network_security_rule" "nsgrules" {
  for_each                     = local.nsg_rules
  name                         = each.value.name
  resource_group_name          = data.azurerm_resource_group.main.name
  network_security_group_name  = azurerm_network_security_group.nsg.name
  priority                     = each.value.priority
  direction                    = each.value.direction
  access                       = each.value.access
  protocol                     = each.value.protocol
  source_port_range            = lookup(each.value, "source_port_range", null)
  source_port_ranges           = lookup(each.value, "source_port_ranges", null)
  destination_port_range       = lookup(each.value, "destination_port_range", null)
  destination_port_ranges      = lookup(each.value, "destination_port_ranges", null)
  source_address_prefix        = lookup(each.value, "source_address_prefix", null)
  source_address_prefixes      = lookup(each.value, "source_address_prefixes", null)
  destination_address_prefix   = lookup(each.value, "destination_address_prefix", null)
  destination_address_prefixes = lookup(each.value, "destination_address_prefixes", null)
}