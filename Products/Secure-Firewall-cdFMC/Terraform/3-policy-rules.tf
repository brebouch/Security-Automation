########################################################
#
# Policy Rules
#
#########################################################

####################
# Data Sources
####################

# No data sources

####################
# Resources
####################

# Access Policy Rule
resource "fmc_access_rules" "access_rule" {
  #depends_on = [fmc_devices.ftd]
  acp                = fmc_access_policies.access_policy.id
  section            = "mandatory"
  name               = "Permit Outbound"
  action             = "allow"
  enabled            = true
  send_events_to_fmc = true
  log_files          = false
  log_begin          = true
  log_end            = true
  source_networks {
    source_network {
      id   = fmc_network_objects.inside_subnet.id
      type = "Network"
    }
  }
  destination_ports {
    destination_port {
      id   = data.fmc_port_objects.http.id
      type = "TCPPortObject"
    }
    destination_port {
      id   = data.fmc_port_objects.http.id
      type = "TCPPortObject"
    }
  }
  ips_policy   = fmc_ips_policies.ips_policy.id
  new_comments = ["outbound web traffic"]
}

# Auto NAT Rule
/*
resource "fmc_ftd_autonat_rules" "new_rule" {
    nat_policy = fmc_ftd_nat_policies.nat_policy.id
    description = "Testing Auto NAT priv-pub"
    nat_type = "static"
    source_interface {
        id = data.fmc_security_zones.inside.id
        type = data.fmc_security_zones.inside.type
    }
    destination_interface {
        id = data.fmc_security_zones.outside.id
        type = data.fmc_security_zones.outside.type
    }
    original_network {
        id = data.fmc_network_objects.private.id
        type = data.fmc_network_objects.private.type
    }
    translated_network {
        id = data.fmc_network_objects.public.id
        type = data.fmc_network_objects.public.type
    }
    translated_network_is_destination_interface = false
    original_port {
        port = 53
        protocol = "udp"
    }
    translated_port = 5353
    ipv6 = true
}
*/

# Manual NAT Rule
/*
resource "fmc_ftd_manualnat_rules" "new_rule" {
    nat_policy = fmc_ftd_nat_policies.nat_policy.id
    description = "Testing Manual NAT priv-pub"
    nat_type = "static"
    source_interface {
        id = data.fmc_security_zones.inside.id
        type = data.fmc_security_zones.inside.type
    }
    destination_interface {
        id = data.fmc_security_zones.outside.id
        type = data.fmc_security_zones.outside.type
    }
    original_source {
        id = data.fmc_network_objects.public.id
        type = data.fmc_network_objects.public.type
    }
    translated_destination {
        id = data.fmc_network_objects.public.id
        type = data.fmc_network_objects.public.type
    }
    interface_in_original_destination = true
    interface_in_translated_source = true
    ipv6 = true
}
*/

# Manual NAT After Rule
/*
resource "fmc_ftd_manualnat_rules" "new_rule_after" {
    nat_policy = fmc_ftd_nat_policies.nat_policy.id
    description = "Testing Manual NAT priv-pub"
    nat_type = "static"
    section = "after_auto"
    source_interface {
        id = data.fmc_security_zones.inside.id
        type = data.fmc_security_zones.inside.type
    }
    destination_interface {
        id = data.fmc_security_zones.outside.id
        type = data.fmc_security_zones.outside.type
    }
    original_source {
        id = data.fmc_network_objects.public.id
        type = data.fmc_network_objects.public.type
    }
    translated_destination {
        id = data.fmc_network_objects.public.id
        type = data.fmc_network_objects.public.type
    }
    interface_in_original_destination = true
    interface_in_translated_source = true
    ipv6 = true
}
*/

# Manual NAT Before Rule
/*
resource "fmc_ftd_manualnat_rules" "new_rule_before_1" {
    nat_policy = fmc_ftd_nat_policies.nat_policy.id
    description = "Testing Manual NAT before priv-pub"
    nat_type = "static"
    section = "before_auto"
    target_index = 1
    source_interface {
        id = data.fmc_security_zones.inside.id
        type = data.fmc_security_zones.inside.type
    }
    destination_interface {
        id = data.fmc_security_zones.outside.id
        type = data.fmc_security_zones.outside.type
    }
    original_source {
        id = data.fmc_network_objects.public.id
        type = data.fmc_network_objects.public.type
    }
    translated_destination {
        id = data.fmc_host_objects.CUCMPub.id
        type = data.fmc_host_objects.CUCMPub.type
    }
    interface_in_original_destination = true
    interface_in_translated_source = true
    ipv6 = true
}
*/