resource "azurerm_virtual_machine" "example_linux_vm" {
name = "VM1"
#name = "${var.resource_prefix}-VM"
location = var.location
resource_group_name = var.resourceGroupName
network_interface_ids = [var.network_interface_id1]
vm_size = "Standard_A1_v2"
delete_os_disk_on_termination = true


storage_image_reference {
publisher = "OpenLogic"
offer = "CentOS"
sku = "7.5"
version = "latest"
}


storage_os_disk {
name = "disk1"
caching = "ReadWrite"
create_option = "FromImage"
managed_disk_type = "Standard_LRS"
}

os_profile {
computer_name = "linuxhost"
admin_username = "terminator"
admin_password = "Password@1234"
}
os_profile_linux_config {
disable_password_authentication = false
}
tags = {
environment = "Test"
}
}


resource "azurerm_virtual_machine" "example_linux_vm2" {
name = "VM2"
#name = "${var.resource_prefix}-VM"
location = var.location
resource_group_name = var.resourceGroupName
network_interface_ids = ["${var.network_interface_id2}"]
vm_size = "Standard_A1_v2"
delete_os_disk_on_termination = true


storage_image_reference {
publisher = "OpenLogic"
offer = "CentOS"
sku = "7.5"
version = "latest"
}


storage_os_disk {
name = "disk1"
caching = "ReadWrite"
create_option = "FromImage"
managed_disk_type = "Standard_LRS"
}

os_profile {
computer_name = "linuxhost"
admin_username = "terminator"
admin_password = "Password@1234"
}
os_profile_linux_config {
disable_password_authentication = false
}
tags = {
environment = "Test"
}
}




