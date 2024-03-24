


variable "cdo_base_url" {
  type = string
}

variable "api_token" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type = string
}

variable "host" {
  type = string
}

variable "datastore" {
  type = string
}

variable "datacenter" {
  type = string
}

variable "network" {
  type = string
}

variable "resource_pool" {
  type = string
  default = "default"
}

variable "sdc_password" {
  type = string
}

variable "sdc_ip" {
  type = string
}

variable "sdc_gw" {
  type = string
}

variable "cdo_tenant_name" {
  type = string
}
