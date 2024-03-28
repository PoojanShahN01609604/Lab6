output "linux_vm_hostname" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].name]
}

output "linux_vm_fqdn" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].computer_name]
}

output "linux_private_ip_address" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].private_ip_address]
}

output "linux_public_ip_address" {
  value = [azurerm_linux_virtual_machine.vmlinux[*].public_ip_address]
}

output "linux_availability_set" {
  value = azurerm_availability_set.linux_avs
}
