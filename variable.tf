#resource group#

variable "project_name" {
  type        = string
  description = "This is the project name"
  default     = "devopstraining12345"
}

variable "project_region" {
  type        = string
  description = "This is the project region"
  default     = "Central Us"
}

variable "project_region_short_name" {
  type        = string
  description = "This is the project region short name"
  default     = "cus"
}

#virtual network#

variable "vnet_address_space" {
  type        = list(string)
  description = "This for the address space needed for vnet"
}

##subnet##

variable "snet_address_prefixes" {
  type        = list(string)
  description = "This for the address space needed for snet"
}

variable "webapp_subnets" {
  type        = list(string)
  description = "This for the serverA and serverB"
}

##nsg rules##

variable "nsg_rules" {
  type        = any
  description = "This is for the nsg_rules"
  default     = {}
}