################################################################################################
# Data blocks
################################################################################################
data "fmc_port_objects" "http" {
    name = "HTTP"
}
data "fmc_port_objects" "ssh" {
    name = "SSH"
}
data "fmc_network_objects" "any-ipv4"{
    name = "any-ipv4"
}
data "fmc_device_physical_interfaces" "zero_physical_interface" {
    count = var.insCount
    device_id = data.fmc_devices.device.id
    name = "TenGigabitEthernet0/0"
}
data "fmc_device_physical_interfaces" "one_physical_interface" {
    count = var.insCount
    device_id = data.fmc_devices.device.id
    name = "TenGigabitEthernet0/1"
}

data "fmc_security_zones" "inside" {
    name = "inside"
}

data "fmc_security_zones" "outside" {
    name = "outside"
}

data "fmc_ips_policies" "ips_base_policy" {
  name = "Balanced Security and Connectivity"
}

##################
# Access Policy
##################

# Network Objects
resource "fmc_network_objects" "inside_subnet" {
  name        = "inside_subnet"
  value       = var.inside_subnet
  description = "Inside Network"
}

# Host Objects
resource "fmc_host_objects" "inside_server" {
  name        = "inside_server"
  value       = var.inside_server
  description = "Inside Server"
}

resource "fmc_host_objects" "outside_gw" {
  name        = "outside_gw"
  value       = var.outside_gateway
  description = "Outside Gateway"
}

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

# Access Control Policy Rules
#########################################################

resource "fmc_access_rules" "access_rule_1" {
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

resource "fmc_access_rules" "access_rule_2" {
  #depends_on = [fmc_devices.ftd]
  acp                = fmc_access_policies.access_policy.id
  section            = "mandatory"
  name               = "Access to App Server"
  action             = "allow"
  enabled            = true
  send_events_to_fmc = true
  log_files          = false
  log_begin          = true
  log_end            = true
  destination_networks {
    destination_network {
      id   = fmc_host_objects.inside_server.id
      type = "Host"
    }
    destination_network {
      id   = data.fmc_network_objects.any-ipv4.id
      type = "Network"
    }
  }
  destination_ports {
    destination_port {
      id   = data.fmc_port_objects.ssh.id
      type = "TCPPortObject"
    }
  }
  ips_policy   = fmc_ips_policies.ips_policy.id
  new_comments = ["SSH to App Server"]
}


resource "time_sleep" "wait_8_minutes" {
  depends_on = [vsphere_virtual_machine.vm]

  create_duration = "480s"
}

resource "fmc_devices" "device"{
  depends_on = [time_sleep.wait_8_minutes]
  name = var.hostname
  hostname = var.mgmt_ip4
  regkey = var.fmc_regkey
  license_caps = [ "BASE","MALWARE", "THREAT", "URLFilter"]
  performance_tier = var.ftd_performance_license_tier
  access_policy {
      id = fmc_access_policies.access_policy.id
      type = "AccessPolicy"
  }
}


resource "fmc_staticIPv4_route" "route" {
  depends_on = [data.fmc_devices.device, data.fmc_device_physical_interfaces.zero_physical_interface,data.fmc_device_physical_interfaces.one_physical_interface]
  count = var.insCount
  metric_value = 25
  device_id  = data.fmc_devices.device.id
  interface_name = "outside"
  selected_networks {
      id = data.fmc_network_objects.any-ipv4.id
      type = data.fmc_network_objects.any-ipv4.type
      name = data.fmc_network_objects.any-ipv4.name
  }
  gateway {
    object {
      id   = fmc_host_objects.outside_gw.id
      type = fmc_host_objects.outside_gw.type
      name = fmc_host_objects.outside_gw.name
    }
  }
}


resource "fmc_ftd_deploy" "ftd" {
    depends_on = [fmc_staticIPv4_route.route]
    count = var.insCount
    device = data.fmc_devices.device.id
    ignore_warning = true
    force_deploy = false
}

##############################
#Intermediate data block for devices
##############################
data "fmc_devices" "device" {
  depends_on = [fmc_devices.device]
  name = var.hostname
}
