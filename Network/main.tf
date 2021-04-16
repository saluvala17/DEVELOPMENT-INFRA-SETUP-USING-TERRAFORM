resource "azurerm_network_security_group" "testnsg" {
   name="testnsg"
   location=var.location
   resource_group_name = var.resourceGroupName
}

resource "azurerm_network_security_rule" "port80" {
    name = "allow80"
    priority = 102
    direction="Inbound"
    access="Allow"
    protocol="Tcp"
    source_port_range="*"
    destination_port_range="80"
    source_address_prefix="*"
    destination_address_prefix="80"
    resource_group_name=azurerm_network_security_group.testnsg.resource_group_name
    network_security_group_name=azurerm_network_security_group.testnsg.name
}

resource "azurerm_network_security_rule" "port443" {
    name = "allow443"
    priority = 101
    direction="Inbound"
    access="Allow"
    protocol="Tcp"
    source_port_range="*"
    destination_port_range="443"
    source_address_prefix="*"
    destination_address_prefix="443"
    resource_group_name=azurerm_network_security_group.testnsg.resource_group_name
    network_security_group_name=azurerm_network_security_group.testnsg.name
}


resource "azurerm_virtual_network" "vnet" {
name="Vnet1"  
location = var.location
resource_group_name = var.resourceGroupName
address_space = [ "10.0.0.0/16" ]
dns_servers = [ "8.8.8.8","8.8.4.4" ]

tags = {
  "Environment" = "Dev"
}
}

resource "azurerm_subnet" "vnet1-subnet" {
  name = "Vnet1-subnet"
  address_prefix = "10.0.1.0/24"
  resource_group_name = azurerm_network_security_group.testnsg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
    }

resource "azurerm_subnet" "vnet1-subnet2" {
  name = "Vnet1-subnet2"
  address_prefix = "10.0.2.0/24"
  resource_group_name = azurerm_network_security_group.testnsg.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
    }


resource "azurerm_public_ip" "testpublicip" {
  name = "testpublicIP"
  resource_group_name = azurerm_network_security_group.testnsg.resource_group_name
  location = var.location
  allocation_method="Static"
  ip_version = "Ipv4"
}

resource "azurerm_public_ip" "testpublicip2" {
  name = "testpublicIP2"
  resource_group_name = azurerm_network_security_group.testnsg.resource_group_name
  location = var.location
  allocation_method="Static"
  ip_version = "Ipv4"
}

resource "azurerm_network_interface" "testVM1interface" {
    name = "testVM1interface"
    resource_group_name = azurerm_network_security_group.testnsg.resource_group_name
    location=var.location

    ip_configuration {
      name="Devconfig1"
      subnet_id = azurerm_subnet.vnet1-subnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = "${azurerm_public_ip.testpublicip.id}"
          }
}

resource "azurerm_network_interface" "testVM2interface" {
    name = "testVM2interface"
    resource_group_name = azurerm_network_security_group.testnsg.resource_group_name
    location=var.location

    ip_configuration {
      name="Devconfig1"
      subnet_id = azurerm_subnet.vnet1-subnet2.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = "${azurerm_public_ip.testpublicip2.id}"
          }
}


