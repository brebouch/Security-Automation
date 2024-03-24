#########################################
#
# ASA DHCP
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# DHCP Relay Global Settings
resource "ciscoasa_dhcp_relay_globalsettings" "test" {
  ipv4_timeout              = 90
  ipv6_timeout              = 90
  trusted_on_all_interfaces = true
}

# DHCP Relay
resource "ciscoasa_dhcp_relay_local" "dhcp_relay_test" {
  interface = ciscoasa_interface_physical.tengig_ipv4_dhcp.name
  servers = [
    "166.177.180.190",
    "20.20.30.26",
    "135.144.153.163"
  ]
}

# DHCP Server
resource "ciscoasa_dhcp_server" "dhcp_test" {
  interface             = ciscoasa_interface_physical.ipv4_interface.name
  enabled               = true
  pool_start_ip         = "8.8.8.4"
  pool_end_ip           = "8.8.8.20"
  dns_ip_primary        = "3.3.3.3"
  dns_ip_secondary      = "5.5.5.5"
  wins_ip_primary       = "4.4.4.4"
  wins_ip_secondary     = "6.6.6.6"
  lease_length          = "305"
  ping_timeout          = "40"
  domain_name           = "testing1"
  auto_config_enabled   = true
  auto_config_interface = false
  vpn_override          = false
  options {
    type   = "hex"
    code   = 2
    value1 = "c52f"
  }
  options {
    type   = "ascii"
    code   = 4
    value1 = "1261"
  }
  options {
    type   = "ip"
    code   = 13
    value1 = "1.1.1.2"
    value2 = "1.1.2.1"
  }
  ddns_update_dns_client        = true
  ddns_update_both_records      = true
  ddns_override_client_settings = true
}