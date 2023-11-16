#########################################
#
# ASA Access Rules
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# Access Rule In
resource "ciscoasa_access_in_rules" "access_rule_in" {
  interface = "inside"
  rule {
    source              = "192.168.10.5/32"
    destination         = "192.168.15.0/25"
    destination_service = "tcp/443"
  }
  rule {
    source              = "192.168.10.0/24"
    source_service      = "udp"
    destination         = "192.168.15.6/32"
    destination_service = "udp/53"
  }
  rule {
    source              = "192.168.10.0/23"
    destination         = "192.168.12.0/23"
    destination_service = "icmp/0"
  }
}

# Access Rule Out
resource "ciscoasa_access_out_rules" "access_rule_out" {
  interface = "inside"
  rule {
    source              = "192.168.10.5/32"
    destination         = "192.168.15.0/25"
    destination_service = "tcp/443"
  }
  rule {
    source              = "192.168.10.0/24"
    source_service      = "udp"
    destination         = "192.168.15.6/32"
    destination_service = "udp/53"
  }
  rule {
    source              = "192.168.10.0/23"
    destination         = "192.168.12.0/23"
    destination_service = "icmp/0"
  }
}