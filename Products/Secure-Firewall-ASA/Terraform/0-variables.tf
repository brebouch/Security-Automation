
variable "username" {
  type = string
  default = ""
}

variable "password" {
  type = string
  default = ""
}

variable "api_url" {
  type = string
}

variable "ssl_no_verify" {
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