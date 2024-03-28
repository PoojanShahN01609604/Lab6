variable "network_Rg_name" {}

variable "network_Rg_location" {}

variable "vnet_name" {
  type    = string
  default = "network-vnet"
}

variable "vnet_aspace" {
  default = ["10.0.0.0/16"]
}

variable "subnet1" {
  type    = string
  default = "network-subnet1"
}

variable "subnet2" {
  type    = string
  default = "network-subnet2"
}

variable "subnet1_aspace" {
  default = ["10.0.0.0/24"]
}

variable "subnet2_aspace" {
  default = ["10.0.1.0/24"]
}

variable "nsg1" {
  type    = string
  default = "network-nsg1"
}

variable "nsg2" {
  type    = string
  default = "network-nsg2"
}
