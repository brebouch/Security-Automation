# Create default Access Control Policy
resource "fmc_access_policies" "access_policy" {
  name           = "FTDv-Access-Policy"
  default_action = "block"
}

# IPS Policy
resource "fmc_ips_policies" "ips_policy" {
  name            = "ftdv_ips_policy"
  inspection_mode = "DETECTION"
  basepolicy_id   = data.fmc_ips_policies.ips_base_policy.id
}