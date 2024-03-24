#########################################
#
# Secure Workload Scopes
#
#########################################

####################
# Data Sources
####################

# Tag
data "tetration_tag" "tag" {}

####################
# Resources
####################

# Tag
resource "tetration_tag" "tag" {
  tenant_name = "acme"
  ip          = "10.0.0.1"
  attributes = {
    Environment = "test"
    Datacenter  = "aws"
    app_name    = "product-service"
  }
}