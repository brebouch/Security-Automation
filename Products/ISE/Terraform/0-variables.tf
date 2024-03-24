
variable "username" {
  type = string
  default = ""
}

variable "password" {
  type = string
  default = ""
}

variable "url" {
  type = string
}

variable "insecure" {
  type = true
}

variable "env_prefix" {
  type = string
  default = "terraform_lab_"
}

variable "device_name" {
  type = string
  default = "NGFW-FTD"
}