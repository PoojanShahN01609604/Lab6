resource "azurerm_network_interface" "linux-nic" {
  name                = "${var.linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.linux_Rg_location
  resource_group_name = var.linux_Rg_name
  tags                = local.common_tags
  count               = var.nb_count

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet1_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux-pip[*].id, count.index + 1)

  }
}

resource "azurerm_public_ip" "linux-pip" {
  name                = "${var.linux_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.linux_Rg_location
  tags                = local.common_tags
  resource_group_name = var.linux_Rg_name
  domain_name_label   = "${var.linux_name}-${format("%1d", count.index + 1)}"
  allocation_method   = "Dynamic"
  count               = var.nb_count
}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  name                  = "${var.linux_name}-${format("%1d", count.index + 1)}"
  count                 = var.nb_count
  location              = var.linux_Rg_location
  tags                  = local.common_tags
  resource_group_name   = var.linux_Rg_name
  network_interface_ids = [element(azurerm_network_interface.linux-nic[*].id, count.index + 1)]
  computer_name         = "${var.linux_name}-${format("%1d", count.index + 1)}"
  size                  = var.linux_size
  admin_username        = var.admin_username

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.linux_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = var.ubuntu_publisher
    offer     = var.ubuntu_offer
    sku       = var.ubuntu_sku
    version   = var.ubuntu_version
  }
}

resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  resource_group_name          = var.linux_Rg_name
  location                     = var.linux_Rg_location
  managed                      = true
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

