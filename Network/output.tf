output "resourcegroup" {
    value = var.resourceGroupName
}

output "subscription_id" {
    value = var.subscription_id
}

output "securitygroupid" {
    value = "${azurerm_network_security_group.testnsg.id}"
}

output "network_interface_id" {
    value = ["${azurerm_network_interface.testVM1interface.id}","${azurerm_network_interface.testVM2interface.id}"]
}


