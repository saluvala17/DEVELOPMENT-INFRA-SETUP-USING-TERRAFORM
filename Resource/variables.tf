provider "azurerm"{
    subscription_id = "${var.subscription_id}"
    client_id = "${var.client_id}"
    tenant_id = "${var.tenant_id}"
    client_secret = "${var.client_secret}"

    features {}
}

variable "resourceGroupName" {
  description="Saluvalatest"
}

variable "location" {
  description="Central India"
}


variable "subscription_id" {
  description="Enter subscription id"
}

variable "client_id" {
  description="Enter client_id"
}

variable "tenant_id" {
  description="Enter tenant_id"
}

variable "client_secret" {
  description="Enter client_secret"
}

