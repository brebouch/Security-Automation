
terraform {
  required_providers {
    fmc = {
      source = "CiscoDevNet/fmc"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider "fmc" {
    fmc_username = var.fmc_username
    fmc_password = var.fmc_password
    fmc_host = var.fmc_ip
    fmc_insecure_skip_verify = var.fmc_insecure_skip_verify
}
