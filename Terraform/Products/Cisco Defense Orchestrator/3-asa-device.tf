#########################################
#
# API Token
#
#########################################

####################
# Data Sources
####################

data "cdo_asa_device" "asa" {
  name = "ASA-Device"
}

####################
# Resources
####################

resource "cdo_asa_device" "asa" {
  name                = "ASA-Device"
  connector_type      = "CDG"
  ignore_certificate  = true
  username            = "username"
  password            = "password"
  socket_address      = "10.10.10.10:22"
  connector_name      = "Optional Connector Name"
  labels              = ["Optional", "Set", "Of", "Labels"]
}