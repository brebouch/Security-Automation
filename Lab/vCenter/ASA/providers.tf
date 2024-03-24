
terraform {
  required_providers {
    asa = {
      source = "CiscoDevNet/ciscoasa"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider "asa" {
  api_url       = "<IP Address of Cisco ASA>"
  username      = "<Username>"
  password      = "<Password>"
  ssl_no_verify = false
}
