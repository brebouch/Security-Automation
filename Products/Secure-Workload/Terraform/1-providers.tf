terraform {
  required_providers {
    tetration = {
      source = "CiscoDevNet/tetration"
      version = "0.1.0"
    }
  }
}

provider "tetration" {
  api_key                  = var.api_key
  api_secret               = var.api_secret
  api_url                  = var.api_url
  disable_tls_verification = var.ssl_no_verify
}