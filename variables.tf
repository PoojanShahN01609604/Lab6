variable "windows_avs" {
  default     = "lab-db1-u-vm"
}

variable "subnet2_id" {}

variable "windows_Rg_name" {}

variable "windows_Rg_location" {}

variable "windows_name" {
  type = map(string)

  default = {
    "n01605112-w-vm1" = "Standard_B1s"
    "n01605112-w-vm2" = "Standard_B1ms"
  }
}

variable "windows_admin_username" {
  default     = "uday"
}

variable "windows_admin_password" {
  default     = "Krishna@2110"
}

variable "windows_public_key" {
  type        = string
  default     = "~/.ssh/id_rsa.pub" 
}

variable "windows_os_disk_storage_account_type" {
  type        = string
  default     = "StandardSSD_LRS"
}

variable "windows_os_disk_size" {
  type        = number
  default     = 128
}

variable "windows_os_disk_caching" {
  type        = string
  default     = "ReadWrite"
}

variable "windows_publisher" {
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  type        = string
  default     = "WindowsServer"
}

variable "windows_sku" {
  type        = string
  default     = "2016-Datacenter"
}

variable "windows_version" {
  type        = string
  default     = "latest"
}

