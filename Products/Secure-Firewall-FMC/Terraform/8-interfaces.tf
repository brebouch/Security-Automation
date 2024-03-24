##########################################
#
# Interfaces
#
##########################################

####################
# Data Sources
####################

# Physical Interface
data "fmc_device_physical_interfaces" "physical_interface" {
    device_id = data.fmc_devices.device.id
    name = "TenGigabitEthernet0/0"
}

# Sub Interface
data "fmc_device_subinterfaces" "sub_interfaces" {
    device_id = data.fmc_devices.device.id
    subinterface_id = 1
}

# VNI Interface
data "fmc_device_vni" "test-vni" {
    device_id = data.fmc_devices.device.id
    name = "TEST-VNI"
}

# VTEP Policy
data "fmc_device_vtep_policies" "vtep" {
   device_id = data.fmc_devices.device.id
}

####################
# Resources
####################

# Physical Interface
resource "fmc_device_physical_interfaces" "physical_interface" {
    name = "<name>"
     device_id = "<ID of the ftd>"
     physical_interface_id = "<ID of the physical interface>"
     security_zone_id = "<ID of the security zone>"
     if_name = "Inside"
     description = "<description>"
     mtu = 1700
     mode = "NONE"
     ipv4_static_address = "10.20.220.45"
     ipv4_static_netmask = 24
     ipv4_dhcp_enabled = "false"
     ipv4_dhcp_route_metric = 1
     ipv6_address = "2001:1234:5678:1234::"
     ipv6_prefix = 32
     ipv6_enforce_eui = "false"
}

# Sub-Interface
resource "fmc_device_subinterfaces" "sub" {
    name = "GigabitEthernet0/1"
     device_id = "<ID of the ftd>"
     subinterface_id = 1
     vlan_id = 30
     security_zone_id = "<ID of the security zone>"
     if_name = "Inside"
     mtu = 1700
     mode = "NONE"
     enabled =   true
     ipv4_static_address = "10.20.220.45"
     ipv4_static_netmask = 24
     ipv4_dhcp_enabled = false
     ipv4_dhcp_route_metric = 1
     ipv6_address = "2001:10:240:ac::a"
     ipv6_prefix = 124
     ipv6_enforce_eui =   false
}

# VNI
resource "fmc_device_vni" "my_fmc_device_vni" {
     device_id = "<ID of the ftd>"
     security_zone_id = "<ID of the security zone>"
     if_name = "Inside"
     description = "<description>"
     priority = 3
     vnid = 11
     multicast_groupaddress = "224.0.0.34"
     segment_id = 4011
     enable_proxy= false
     ipv4 {
        static {
         address = "3.3.3.3"
         netmask = 4
}
        dhcp {
         enable_default_route_dhcp = false
         dhcp_route_metric = 0
          }
    }
}

# VTEP Interface
resource "fmc_device_vtep" "my_fmc_device_vtep" {
    device_id = data.fmc_devices.device.id
    nve_enabled = true
    nve_vtep_id = 1
    nve_destination_port = 6081
    nve_encapsulation_type = "GENEVE"
    source_interface_id = data.fmc_device_physical_interfaces.physical_interface1.id
}