#########################################
#
# Secure Workload Filters
#
#########################################

####################
# Data Sources
####################

# Filter
data "tetration_filter" "filter" {}

####################
# Resources
####################

# Filter
resource "tetration_filter" "filter" {
  name         = "Terraform created filter"
  query        = <<EOF
                    {
                      "type": "eq",
                      "field": "ip",
                      "value": "10.0.0.1"
                    }
          EOF
  app_scope_id = "5ed6890c497d4f55eb5c585c"
  primary      = true
  public       = false
}

# Filter With Complex Query
resource "tetration_filter" "filter" {
  name         = "Terraform created filter"
  query        = <<EOF
            {
               "type": "and",
               "filters": [
                  {
                     "field": "vrf_id",
                     "type": "eq",
                     "value": 700056
                  },
                  {
                     "type": "or",
                     "filters": [
                        {
                           "field": "ip",
                           "type": "eq",
                           "value": "10.254.252.43"
                        },
                        {
                           "field": "ip",
                           "type": "eq",
                           "value": "10.254.252.51"
                        },
                        {
                           "field": "ip",
                           "type": "eq",
                           "value": "10.254.252.52"
                        }
                     ]
                  }
               ]
            }
          EOF
  app_scope_id = "5ed6890c497d4f55eb5c585c"
  primary      = true
  public       = false
}