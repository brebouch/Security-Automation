#########################################
#
# Secure Workload Roles
#
#########################################

####################
# Data Sources
####################

# Role
data "tetration_role" "roles" {}

####################
# Resources
####################

# Simple Read Only Role
resource "tetration_role" "read_role" {
  name                = "read_role"
  app_scope_id        = "5ce71503497d4f2c23af85b7"
  access_app_scope_id = "5ceea87b497d4f753baf85bc"
  access_type         = "scope_read"
  user_ids            = ["5eab4dd8497d4f2bec5c585f"]
  description         = "role which provides read-only access to role_your_own_application"
}

# Developer Role
resource "tetration_role" "dev_role" {
  name                = "dev_role"
  app_scope_id        = "5ce71503497d4f2c23af85b7"
  access_app_scope_id = "5ceea87b497d4f753baf85bc"
  access_type         = "developer"
  user_ids            = ["5eab4dd8497d4f2bec5c585f"]
  description         = "role which provides developer access to role_your_own_application"
}