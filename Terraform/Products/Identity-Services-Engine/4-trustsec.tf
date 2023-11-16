#########################################
#
# ISE TrustSec
#
#########################################

####################
# Data Sources
####################

# TrustSec Egress Matrix Cell
data "ise_trustsec_egress_matrix_cell" "example" {
  id = "76d24097-41c4-4558-a4d0-a8c07ac08470"
}

# TrustSec IP to SGT Mapping
data "ise_trustsec_ip_to_sgt_mapping" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of IP to SGT mapping"
}

# TrustSec IP to SGT Mapping Group
data "ise_trustsec_ip_to_sgt_mapping_group" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of IP to SGT mapping group"
}

# TrustSec Security Group
data "ise_trustsec_security_group" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of security group"
}

# TrustSec Security Group ACL
data "ise_trustsec_security_group_acl" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of security group ACL"
}

####################
# Resources
####################

# TrustSec Egress Matrix Cell
resource "ise_trustsec_egress_matrix_cell" "example" {
  description        = "EgressMatrixCell Description"
  default_rule       = "NONE"
  matrix_cell_status = "ENABLED"
  sgacls             = ["26b76b10-66e6-11ee-9cc1-9eb2a3ecc82a, 9d64dcd0-6384-11ee-9cc1-9eb2a3ecc82a"]
  source_sgt_id      = "93c66ed0-8c01-11e6-996c-525400b48521"
  destination_sgt_id = "93e1bf00-8c01-11e6-996c-525400b48521"
}

# TrustSec IP to SGT Mapping
resource "ise_trustsec_ip_to_sgt_mapping" "example" {
  name        = "10.0.0.1/32"
  deploy_type = "ALL"
  host_ip     = "10.0.0.1/32"
  sgt         = "93e1bf00-8c01-11e6-996c-525400b48521"
}

# TrustSec IP to SGT Mapping Group
resource "ise_trustsec_ip_to_sgt_mapping_group" "example" {
  name        = "groupA"
  deploy_type = "ALL"
  sgt         = "93e1bf00-8c01-11e6-996c-525400b48521"
}

# TrustSec Security Group
resource "ise_trustsec_security_group" "example" {
  name              = "SGT1234"
  description       = "My SGT"
  value             = 1234
  propogate_to_apic = true
  is_read_only      = false
}

# TrustSec Security Group ACL
resource "ise_trustsec_security_group_acl" "example" {
  name        = "ACL1"
  description = "SG ACL 1"
  acl_content = "Permit IP"
  ip_version  = "IPV4"
  read_only   = false
}