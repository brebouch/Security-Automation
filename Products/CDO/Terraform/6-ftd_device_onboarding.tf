#########################################
#
# FTD Devce Onboarding
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

resource "cdo_ftd_device_onboarding" "ftd" {
  ftd_uid                = cdo_ftd_device.ftd.id
}