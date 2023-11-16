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