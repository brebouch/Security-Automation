##########################################
#
# Security Zones
#
##########################################

####################
# Data Sources
####################

# Security Zone
data "fmc_security_zones" "inside" {
    name = "inside"
}

####################
# Resources
####################

# Security Zone
resource "fmc_security_zone" "security_zone" {
  name          = "security_zone"
  interface_mode = "INLINE"
}
