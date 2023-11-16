#########################################
#
# CDO Users
#
#########################################

####################
# Data Sources
####################

data "cdo_user" "user" {
  name = "CDO-User-Name"
}

####################
# Resources
####################

resource "cdo_user" "user" {
  name              = "CDO-User-Name"
  role              = "One of: ROLE_READ_ONLY, ROLE_ADMIN, ROLE_SUPER_ADMIN, ROLE_DEPLOY_ONLY, ROLE_EDIT_ONLY, ROLE_VPN_SESSIONS_MANAGER"
  is_api_only_user  = true
}