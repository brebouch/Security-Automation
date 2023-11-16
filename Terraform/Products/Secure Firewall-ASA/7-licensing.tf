#########################################
#
# ASA Licensing
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# License Config
resource "ciscoasa_license_config" "license" {
  throughput         = "2G"
}

# Register Smart License
resource "ciscoasa_license_register" "license" {
  id_token = "<registration token>"
}

# Renew Smart License
resource "ciscoasa_license_renewid" "license" {}

# Renew Smart License Authorization
resource "ciscoasa_license_renewauth" "license" {}

