#########################################
#
# API Token
#
#########################################

####################
# Data Sources
####################

data "cdo_ftd_device" "ftd" {
  name = "ftd-device-name"
}

####################
# Resources
####################

resource "cdo_ftd_device" "ftd" {
  name                = "ftd-device-name"
  access_policy_name  = "Name-Of-ACP"
  licenses            = ["BASE", "CARRIER", "THREAT", "MALWARE", "URLFilter"]
  virtual             = true
  performance_tier      = "FTDv20"
  labels              = ["Optional", "Set", "Of", "Labels"]
}