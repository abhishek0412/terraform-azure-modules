#VM
#================================

data "template_cloudinit_config" "webapp_config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = <<-EOF
    #! /bin/bash
    apt-get -y update
    apt-get -y install nginx
    apt-get -y install jq

    systemctl restart nginx
    systemctl status nginx
    echo fin v1.00!
    EOF
  }
}

resource "azurerm_linux_virtual_machine" "cloudacademy_vm1" {
  name                  = "${var.environment}-cloudacademy-vm1"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.vnetwork_interface_id]
  size                  = "Standard_B1s"

  os_disk {
    name                 = "vm1-disk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  computer_name                   = "cloudacademy-vm1"
  admin_username                  = var.admin_name
  admin_password                  = var.admin_password
  disable_password_authentication = false

  custom_data = data.template_cloudinit_config.webapp_config.rendered

  tags = {
    org         = "cloudacademy"
    environment = var.environment
  }
}
