#########################################
#
# Secure Device Connector
#
#########################################

####################
# Data Sources
####################

data "cdo_sdc" "sdc" {
  name = "Secure-Device-Connector"
}

####################
# Resources
####################

resource "cdo_sdc" "sdc" {
  name = "Secure-Device-Connector"
}