output "network_Rg_name" {
  value = module.resource_group.network_Rg_name
}

output "linux_Rg_name" {
  value = module.resource_group.linux_Rg_name
}

output "windows_Rg_name" {
  value = module.resource_group.windows_Rg_name
}

output "network_Rg_location" {
  value = module.resource_group.network_Rg_location
}

output "linux_Rg_location" {
  value = module.resource_group.linux_Rg_location
}

output "windows_Rg_location" {
  value = module.resource_group.windows_Rg_location
}

output "virtual_network_name" {
  value = module.network.virtual_network_name
}

output "virtual_network_address_space" {
  value = module.network.virtual_network_address_space
}

output "subnet1_name" {
  value = module.network.subnet1_name
}

output "subnet_address_space_1" {
  value = module.network.subnet_address_space_1
}

output "subnet1_id" {
  value = module.network.subnet1_id
}

output "subnet2_name" {
  value = module.network.subnet2_name
}

output "subnet_address_space_2" {
  value = module.network.subnet_address_space_1
}
output "network_security_group1_name" {
  value = module.network.network_security_group1_name
}

output "network_security_group2_name" {
  value = module.network.network_security_group2_name
}
output "linux_vm_hostname" {
  value = module.linux.linux_vm_hostname
}

output "linux_vm_fqdn" {
  value = module.linux.linux_vm_fqdn
}

output "linux_private_ip_address" {
  value = module.linux.linux_private_ip_address
}

output "linux_public_ip_address" {
  value = module.linux.linux_public_ip_address
}

output "linux_availability_set" {
  value = module.linux.linux_availability_set
}

output "windows_vm_hostname" {
  value = module.windows.windows_vm_hostname
}

output "windows_vm_fqdn" {
  value = module.windows.windows_vm_fqdn
}

output "windows_private_ip_address" {
  value = module.windows.windows_private_ip_address
}

output "windows_public_ip_address" {
  value = module.windows.windows_public_ip_address
}

output "windows_availability_set" {
  value = module.windows.windows_availability_set
}
