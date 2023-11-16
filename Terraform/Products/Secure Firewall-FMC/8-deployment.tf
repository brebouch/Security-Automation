###################################
#
# Deployment Terraform Examples
#
###################################


# Deployment
/*
resource "fmc_ftd_deploy" "ftd" {
    device = data.fmc_devices.ftd.id
    ignore_warning = false
    force_deploy = false
}
*/