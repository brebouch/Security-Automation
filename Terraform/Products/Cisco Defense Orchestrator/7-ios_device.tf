#########################################
#
# IOS Device
#
#########################################

####################
# Data Sources
####################

data "cdo_ios_device" "ios" {
  name = "IOS-Device"
}

####################
# Resources
####################

resource "cdo_ios_device" "ios" {
  name                = "IOS-Device"
  ignore_certificate  = true
  username            = "username"
  password            = "password"
  socket_address      = "10.10.10.10:22"
  connector_name      = "Required Connector Name"
  labels              = ["Optional", "Set", "Of", "Labels"]
}