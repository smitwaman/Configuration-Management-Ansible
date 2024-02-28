variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Location for all resources"
  default     = "East US 2"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "public_ip_name" {
  description = "Name of the public IP"
}

variable "public_ip_allocation_method" {
  description = "Allocation method for the public IP"
  default     = "Dynamic"
}

variable "nsg_name" {
  description = "Name of the network security group"
}

variable "network_interface_name" {
  description = "Name of the network interface"
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration"
}

variable "private_ip_allocation" {
  description = "Allocation method for the private IP"
  default     = "Dynamic"
}

variable "vm_name" {
  description = "Name of the virtual machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
}

variable "vm_admin_username" {
  description = "Admin username for the virtual machine"
}



variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk"
  default     = "Standard_LRS"
}
