
###################################################
#
# Policies
#
###################################################

####################
# Data Sources
####################

# Access Policy
data "fmc_access_policies" "acp" {
    name = "FTD ACP"
}

# File Policy
data "fmc_file_policies" "file_policy" {
    name = "AMP Policy"
}

# IPS Policy
data "fmc_ips_policies" "ips_policy" {
  name = "Balanced Security and Connectivity"
}

# NAT Policy
data "fmc_ftd_nat_policies" "nat_policy" {
    name = "FTD NATP"
}

# Network Analysis Policy
data "fmc_network_analysis_policies" "network_analysis_policy" {
    name = "AMP Policy"
}

####################
# Resources
####################

# Create default Access Control Policy
resource "fmc_access_policies" "access_policy" {
  name           = "FTDv-Access-Policy"
  default_action = "block"
}

# IPS Policy
resource "fmc_ips_policies" "ips_policy" {
  name            = "ftdv_ips_policy"
  inspection_mode = "DETECTION"
  basepolicy_id   = data.fmc_ips_policies.ips_policy.id
}