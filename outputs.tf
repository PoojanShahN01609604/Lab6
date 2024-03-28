output "windows_vm_hostname" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].name
  }

output "windows_vm_fqdn" {
  value = values(azurerm_public_ip.windows-pip)[*].fqdn
}

output "windows_private_ip_address" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].private_ip_address
}

output "windows_public_ip_address" {
  value = values(azurerm_windows_virtual_machine.vmwindows)[*].public_ip_address
}

output "windows_availability_set" {
  value = azurerm_availability_set.windows_avs.name
}

