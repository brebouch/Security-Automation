
###################################################
#
# Access Control Lists
#
###################################################

####################
# Data Sources
####################

# Extended ACL
data "fmc_extended_acl" "extended-acl" {
    name = "TEST-ACL"
}

# Standard ACL
data "fmc_standard_acl" "std-acl" {
    name = "STD-ACL"
}

####################
# Resources
####################

# Extended Access List
resource "fmc_extended_acl" "acl1" {
    name = "ACL-1"
    action = "DENY"
    log_level = "ERROR"
    logging = "PER_ACCESS_LIST_ENTRY"
    log_interval= 545
}

# Standard Access List
resource "fmc_standard_acl" "acl1" {
    name = "ACL-1"
    action = "DENY"
    object_id = data.fmc_network_objects.network_object.id
    literal_value = "1.1.1.1"
}