resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  resource_group_name          = var.windows_Rg_name
  location                     = var.windows_Rg_location
  managed                      = true
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "windows-nic" {
  for_each                      = var.windows_name
  name                      = "${each.key}-nic"
  location                  = var.windows_Rg_location 
  resource_group_name       = var.windows_Rg_name

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id = var.subnet2_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.windows-pip[each.key].id
    
  }
}

resource "azurerm_public_ip" "windows-pip" {
  for_each                      = var.windows_name
  name                      = "${each.key}-pip"
  location            = var.windows_Rg_location
  resource_group_name = var.windows_Rg_name
  domain_name_label = each.key
  allocation_method = "Dynamic"
}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  for_each                      = var.windows_name
  name                      = each.key
  location                    = var.windows_Rg_location 
  resource_group_name         = var.windows_Rg_name
  size                    = each.value
  admin_username           = var.windows_admin_username
  admin_password           = var.windows_admin_password
  network_interface_ids           = [azurerm_network_interface.windows-nic[each.key].id]
 
winrm_listener {
    protocol                  = "Http"
  }

  os_disk {
    name                      = "${each.key}-os-disk"
    caching                   = var.windows_os_disk_caching
    storage_account_type      = var.windows_os_disk_storage_account_type
    disk_size_gb              = var.windows_os_disk_size
  }
  source_image_reference {
    publisher                 = var.windows_publisher
    offer                     = var.windows_offer
    sku                       = var.windows_sku
    version                   = var.windows_version
  }
  
}

