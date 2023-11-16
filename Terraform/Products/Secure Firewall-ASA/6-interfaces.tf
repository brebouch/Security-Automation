#########################################
#
# ASA Interfaces
#
#########################################

####################
# Data Sources
####################

# Physical Interface
data "ciscoasa_interface_physical" "mgmt" {
  hardware_id = "Management0/0"
}

# All Physical Interfaces
data "ciscoasa_interfaces_physical" "all" {}

# VLAN Interface
data "ciscoasa_interface_vlan" "vlantengig140" {
  hardware_id = "TenGigabitEthernet0/0.140"
}

# All VLAN Interfaces
data "ciscoasa_interfaces_vlan" "all" {}

####################
# Resources
####################

# Physical Static Interface
resource "ciscoasa_interface_physical" "tengig_ipv4_static" {
  name           = "tengig0"
  hardware_id    = "TenGigabitEthernet0/0"
  interface_desc = "TenGig Static"
  ip_address {
    static {
      ip       = "10.0.1.5"
      net_mask = "255.255.255.0"
    }
  }
  security_level = 0
}

# Physical DHCP Interface
resource "ciscoasa_interface_physical" "tengig_ipv4_dhcp" {
  name           = "tengig1"
  hardware_id    = "TenGigabitEthernet0/1"
  interface_desc = "TenGig DHCP"

  ip_address {
    dhcp {
      dhcp_option_using_mac = false
      dhcp_broadcast        = true
      dhcp_client {
        set_default_route = false
        metric            = 1
        primary_track_id  = 6
        tracking_enabled  = false
      }
    }
  }
  security_level = 0
}

# Physical IPv6 Interface with Standby
resource "ciscoasa_interface_physical" "tengig_ipv6" {
  name           = "tengig2"
  hardware_id    = "TenGigabitEthernet0/2"
  interface_desc = "TenGig Ipv6 with standby address"
  ipv6_info {
    auto_config   = false
    dad_attempts  = 1
    enabled       = true
    enforce_eui64 = false
    link_local_address {
      address = "fe80::202:b3ff:eef1:7234"
      standby = "fe80::202:b3ff"
    }
    ipv6_addresses {
      address       = "2001:db8:2222:1044::47"
      standby       = "2001:db8:2222:1044::46"
      prefix_length = 64
    }
    managed_address_config = true
    n_discovery_prefix_list {
      off_link           = false
      no_advertise       = true
      preferred_lifetime = 604800
      valid_lifetime     = 2592000
      has_duration       = true
      default_prefix     = true
    }
    ns_interval                 = 1000
    other_stateful_config       = true
    reachable_time              = 0
    router_advert_interval      = 250
    router_advert_interval_unit = "sec"
    router_advert_lifetime      = 1800
    suppress_router_advert      = true
  }
  security_level = 0
}

# Empty VLAN Interface
resource "ciscoasa_interface_vlan" "tengig_no_config" {
  name           = "vlantengig140"
  hardware_id    = "TenGigabitEthernet0/0.140"
  interface_desc = "VlanTenGig Zero Conf"
  vlan_id        = 141
  security_level = 0
}

# Static VLAN Interface
resource "ciscoasa_interface_vlan" "tengig_ipv4_static" {
  name           = "vlantengig150"
  hardware_id    = "TenGigabitEthernet0/1.150"
  interface_desc = "VlanTenGig Static"
  ip_address {
    static {
      ip       = "10.0.2.6"
      net_mask = "255.255.255.0"
    }
  }
  security_level = 0
}

# DHCP VLAN Interface
resource "ciscoasa_interface_vlan" "tengig_ipv4_dhcp" {
  name           = "vlantengig160"
  hardware_id    = "TenGigabitEthernet0/1.160"
  interface_desc = "VlanTenGig DHCP"

  ip_address {
    dhcp {
      dhcp_option_using_mac = false
      dhcp_broadcast        = true
      dhcp_client {
        set_default_route = false
        metric            = 1
        primary_track_id  = 6
        tracking_enabled  = false
      }
    }
  }
  security_level = 0
}

# IPv6 VLAN Interface
resource "ciscoasa_interface_vlan" "tengig_ipv6" {
  name           = "vlantengig170"
  hardware_id    = "TenGigabitEthernet0/2.170"
  interface_desc = "VlanTenGig Ipv6 with standby address"
  ipv6_info {
    auto_config   = false
    dad_attempts  = 1
    enabled       = true
    enforce_eui64 = false
    link_local_address {
      address = "fe80::20e:cff:fe3b:883c"
      standby = "fe80::20e:cff"
    }
    ipv6_addresses {
      address       = "2001:db8:a0b:12f0::47"
      standby       = "2001:db8:a0b:12f0::46"
      prefix_length = 64
    }
    managed_address_config = true
    n_discovery_prefix_list {
      off_link           = false
      no_advertise       = true
      preferred_lifetime = 604800
      valid_lifetime     = 2592000
      has_duration       = true
      default_prefix     = true
    }
    ns_interval                 = 1000
    other_stateful_config       = true
    reachable_time              = 0
    router_advert_interval      = 250
    router_advert_interval_unit = "sec"
    router_advert_lifetime      = 1800
    suppress_router_advert      = true
  }
  security_level = 0
}