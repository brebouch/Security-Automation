#########################################
#
# Secure Workload User
#
#########################################

####################
# Data Sources
####################

# User
data "tetration_user" "user" {}

####################
# Resources
####################

# User
resource "tetration_user" "user" {
  email           = "joe@acme.com"
  first_name      = "Joe"
  last_name       = "Bloggs"
  app_scope_id    = "5ce71503497d4f2c23af85b7"
  role_ids        = ["5ce71507755f0267680224af"]
  enable_existing = true
}