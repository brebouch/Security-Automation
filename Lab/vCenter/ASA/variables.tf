
#########################
#
# Connection Variables
#
#########################

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type = string
}

#########################
#
# Cluster/Host Variables
#
#########################

variable "host" {
  type = string
}

variable "host_pci_device" {
  type = string
  default = ""
}

variable "host_thumbprint" {
  type = string
  default = ""
}

variable "compute_cluster" {
  type = string
  default = ""
}

variable "compute_cluster_host_group" {
  type = string
  default = ""
}

variable "resource_pool" {
  type = string
  default = "default"
}

#########################
#
# Inventory Variables
#
#########################

variable "datacenter" {
  type = string
}

variable "custom_attribute" {
  type = string
  default = ""
}

variable "tag" {
  type = string
  default = ""
}

variable "tag_category" {
  type = string
  default = ""
}

variable "folder" {
  type = string
  default = ""
}

#########################
#
# Networking Variables
#
#########################

variable "network" {
  type = string
}

variable "distributed_virtual_switch" {
  type = string
  default = ""
}

variable "virtual_switch" {
  type = string
  default = "vSwitchNGFW-ASA-Inside"
}

variable "virtual_port_group" {
  type = string
  default = "NGFW-ASA-Inside"
}

#########################
#
# Storage Variables
#
#########################

variable "datastore" {
  type = string
}

variable "datastore_cluster" {
  type = string
  default = ""
}

variable "storage_policy" {
  type = string
  default = ""
}

variable "vmfs_disks" {
  type = string
  default = ""
}

#########################
#
# VM Variables
#
#########################

variable "content_library" {
  type = string
  default = "Templates"
}

variable "content_library_item" {
  type = string
  default = ""
}

variable "content_type" {
  type = string
  default = "ovf"
}

variable "virtual_machine" {
  type = string
  default = "ASAv"
}

variable "domain_name" {
  type = string
  default = "dcloud.local"
}


################################
#
# NGFW Variables
#
################################

variable "cpu" {
  default     = "4"
  description = "FTDv number pf CPUs"
  type        = string
}

variable "memory" {
  default     = "8192"
  description = "FTDv memory allocation"
  type        = string
}

variable "ovf_file_path" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  description = "Admin user password"
  type        = string
  sensitive   = true
}

variable "hostname" {
  description = "ASAv hostname"
  type        = string
}

variable "dns1" {
  default     = ""
  description = "Primary DNS Server"
  type        = string
}

variable "dns2" {
  default     = ""
  description = "Secondary DNS Server"
  type        = string
}

variable "dns3" {
  default     = ""
  description = "Tertiary DNS Server"
  type        = string
}

variable "searchdomains" {
  default     = ""
  description = "DNS Search Domains"
  type        = string
}


variable "mgmt_ip4_config" {
  default     = "Manual"
  description = "Management IPv4 Configuration"
  type        = string
}

variable "mgmt_ip4" {
  default     = ""
  description = "Management IPv4 Address"
  type        = string
}

variable "mgmt_ip4_mask" {
  default     = ""
  description = "Management IPv4 Mask"
  type        = string
}

variable "mgmt_ip4_gateway" {
  default     = ""
  description = "Management IPv4 Gateway"
  type        = string
}


#mgmt_ip6_config can be Disabled, Manual or DHCP
variable "mgmt_ip6_config" {
  default     = "Disabled"
  description = "Management IPv6 Configuration"
  type        = string
}

variable "mgmt_ip6" {
  default     = ""
  description = "Management IPv6 Address"
  type        = string
}

variable "mgmt_ip6_mask" {
  default     = ""
  description = "Management IPv6 Mask"
  type        = string
}

variable "mgmt_ip6_gateway" {
  default     = ""
  description = "Management IPv6 Gateway"
  type        = string
}

variable "deployment_option" {
  type = string
  default = "4Core8GB"
}

variable "ssl_no_verify" {
  type = bool
  default = true
}

#############################################
#
# Testing Servers
#
#############################################

variable "inside_subnet" {
  type = string
  default = "172.16.255.0/24"
}

variable "inside_server" {
  type = string
  default = "172.16.255.30"
}

variable "outside_gateway" {
  type = string
  default = "172.16.20.1"
}
