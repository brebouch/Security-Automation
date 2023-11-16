
variable "fmc_username" {
  type = string
  default = ""
}

variable "fmc_password" {
  type = string
  default = ""
}

variable "fmc_host" {
  type = string
}

variable "fmc_insecure_skip_verify" {
  type = string
}

variable "env_prefix" {
  type = string
  default = "terraform_lab_"
}

variable "device_name" {
  type = string
  default = "NGFW-FTD"
}