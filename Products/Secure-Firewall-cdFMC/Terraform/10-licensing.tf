##########################################
#
# Smart Licensing
#
##########################################

####################
# Data Sources
####################

# Smart License
data "fmc_smart_license" "smart_license" {}

####################
# Resources
####################

# Evaluation
resource "fmc_smart_license" "license" {
  registration_type = "EVALUATION"
}

# Register
resource "fmc_smart_license" "license" {
  registration_type = "REGISTER"
  token             = "X2M3YmJlY..."
}

# Force Registration
resource "fmc_smart_license" "license" {
  registration_type = "REGISTER"
  token             = "X2M3YmJlY..."
  force             = true
}

# De-Register on Terraform Destroy
resource "fmc_smart_license" "license" {
  registration_type = "REGISTER"
  token             = "X2M3YmJlY..."
  retain            = false
}
