
###################################################
#
# Deployment
#
###################################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# Deployment

resource "fmc_ftd_deploy" "ftd" {
    device = data.fmc_devices.device.id
    ignore_warning = false
    force_deploy = false
}