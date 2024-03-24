
variable "api_key" {
  type = string
  default = ""
}

variable "api_secret" {
  type = string
  default = ""
}

variable "api_url" {
  type = string
}

variable "ssl_no_verify" {
  type = bool
  default = true
}

variable "env_prefix" {
  type = string
  default = "terraform_lab_"
}

variable "device_name" {
  type = string
  default = "NGFW-FTD"
}