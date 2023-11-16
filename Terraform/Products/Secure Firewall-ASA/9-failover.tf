#########################################
#
# ASA Misc Services
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# Failover Interface
resource "ciscoasa_failover_interface" "inside" {
  hardware_id = ciscoasa_interface_physical.inside.hardware_id
  standby_ip  = ciscoasa_network_object.inside_host.value
  monitored   = false
}

# Failover Setup
resource "ciscoasa_failover_setup" "test" {
  enable                           = true
  lan_interface_hw_id              = "TenGigabitEthernet0/0"
  lan_failover_name                = "test-fo"
  lan_primary_ip                   = "192.168.20.11"
  lan_secondary_ip                 = "192.168.20.12"
  lan_net_mask                     = "255.255.255.0"
  lan_preferred_role               = "secondary"
  state_interface_hw_id            = "TenGigabitEthernet0/0"
  state_failover_name              = "test-fo"
  state_primary_ip                 = "192.168.20.11"
  state_secondary_ip               = "192.168.20.12"
  state_net_mask                   = "255.255.255.0"
  failed_interfaces_threshold      = "10"
  failed_interfaces_threshold_unit = "Percentage"
}