terraform {
  required_providers {
    cdo = {
      source = "CiscoDevNet/cdo"
    }
  }
}

provider "cdo" {
  base_url  = var.cdo_base_url
  api_token = var.api_token
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}
