terraform {
  required_providers {
    fmc = {
      source = "CiscoDevNet/fmc"
    }
  }
}

provider "fmc" {
  fmc_host = var.fmc_host
  is_cdfmc  = var.is_cdfmc
  cdo_token = var.cdo_token
  cdfmc_domain_uuid = var.cdfmc_domain_uuid
}