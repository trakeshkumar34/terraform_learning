locals {
  nsg_rules = {
    SSH = {
      name                       = "AllowSSHInbound"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = 22
      source_address_prefixes    = ["96.78.68.210", "20.37.158.0/27"]
      destination_address_prefix = "*"
      description                = "Allow SSH Inbound Access"
    }
    RDP = {
      name                       = "AllowRDPInbound"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = 3489
      source_address_prefixes    = ["96.78.68.210", "20.37.158.0/27"]
      destination_address_prefix = "*"
      description                = "Allow RDP Inbound Access"
    }
    servera = {
      name                       = "AllowserveraInbound"
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = 8080
      source_address_prefixes    = ["96.78.68.210", "20.37.158.0/27"]
      destination_address_prefix = "*"
      description                = "Allow servera Inbound Access"
    }
    serverb = {
      name                       = "AllowserverbInbound"
      priority                   = 103
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = 8081
      source_address_prefixes    = ["96.78.68.210", "20.37.158.0/27"]
      destination_address_prefix = "*"
      description                = "Allow serverb Inbound Access"
    }
  }
}