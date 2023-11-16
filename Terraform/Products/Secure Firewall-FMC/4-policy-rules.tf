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
