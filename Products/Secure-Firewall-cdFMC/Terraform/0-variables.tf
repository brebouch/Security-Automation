
variable "fmc_host" {
  type = string
}

variable "fmc_insecure_skip_verify" {
  type = string
}

variable "cdo_token" {
  type = string
  default = ""
}

variable "is_cdfmc" {
  type = bool
  default = true
}

variable "cdfmc_domain_uuid" {
  type = string
  default = "e276abec-e0f2-11e3-8169-6d9ed49b625f"
}

variable "cdo_region" {
  type = string
  default = "us"
}

variable "env_prefix" {
  type = string
  default = "terraform_lab_"
}

variable "device_name" {
  type = string
  default = "NGFW-FTD"
}