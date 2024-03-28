resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.vmlinux]
  provisioner "remote-exec" {
    inline = ["/usr/bin/hostname"]
  }

  connection {
    type        = "ssh"
    user        = var.admin_username
    private_key = file(var.private_key)
    host        = element(azurerm_public_ip.linux-pip[*].fqdn, count.index + 1)
  }
}
