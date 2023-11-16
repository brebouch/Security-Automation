##################
# cdFMC Objects
##################

# Network Objects
resource "fmc_network_objects" "inside_subnet" {
  name        = "${var.env_prefix}inside_subnet"
  value       = "172.16.255.0/24"
  description = "Inside Network"
}

# Host Objects
resource "fmc_host_objects" "inside_server" {
  name        = "${var.env_prefix}inside_server"
  value       = "172.16.255.30"
  description = "Inside Server"
}

# Network Objects
resource "fmc_network_objects" "inside_subnet" {
  name        = "${var.env_prefix}inside_subnet"
  value       = "172.16.255.0/24"
  description = "Inside Network"
}

# Range Object
resource "fmc_range_objects" "private_range" {
  name        = "${var.env_prefix}private_range"
  value       = "10.0.0.1-10.255.255.254"
  description = "Private Range"
}

# Network Group Object
resource "fmc_network_group_objects" "network_group" {
  name = "${var.env_prefix}network_group"
  description = "Network Group Object"
  objects {
      id = fmc_network_objects.inside_subnet.id
      type = fmc_network_objects.inside_subnet.type
  }
  objects {
      id = fmc_host_objects.inside_server.id
      type = fmc_host_objects.inside_server.type
  }
  literals {
      value = "10.10.10.10"
      type = "Host"
  }
}

# Dynamic Objects
resource "fmc_dynamic_object" "dynamic_object" {
  name        = "${var.env_prefix}dynamic_object"
  description = "Dynamic Object"
  object_type = "IP"
}

# Dynamic Object Mapping
resource "fmc_dynamic_object_mapping" "dynamic_object_mapping" {
  dynamic_object_id = fmc_dynamic_object.dynamic_object.id
  mappings = ["8.8.8.8"]
}

# TCP Objects
resource "fmc_port_objects" "https" {
  name        = "${var.env_prefix}https_object"
  description = "HTTPS Object"
  port        = "443"
  protocol    = "tcp"
}

# UDP Object
resource "fmc_port_objects" "dns" {
  name        = "${var.env_prefix}dns_object"
  description = "DNS Object"
  port        = "53"
  protocol    = "udp"
}

# ICMP Object
resource "fmc_icmpv4_objects" "icmp" {
  name        = "${var.env_prefix}icmp_object"
  description = "ICMP Object"
  icmp_type   = "0"
}

# Port Group Object
resource "fmc_port_group_objects" "port-group" {
    name = "${var.env_prefix}TCP-ICMP"
    description = "Combo ports"
    objects {
        id = fmc_port_objects.https.id
        type = fmc_port_objects.https.type
    }
    objects {
        id = fmc_icmpv4_objects.icmp.id
        type = fmc_icmpv4_objects.icmp.type
    }
}

# URL Object
resource "fmc_url_objects" "cisco-home" {
    name        = "${var.env_prefix}cisco-home"
    url       = "https://www.cisco.com/"
    description = "Cisco home page"
}

resource "fmc_url_object_group" "URLGroup" {
    name = "${var.env_prefix}URLGroup"
    description = "Websites"
    objects {
        id = fmc_url_objects.cisco-home.id
        type = fmc_url_objects.cisco-home.type
    }
    literals {
        url = "https://www.terraform.io/"
        type = "Url"
    }
}

# FQDN Object
resource "fmc_fqdn_objects" "new" {
  name        = "${var.env_prefix}Cisco-FQDN"
  value       = "cisco.com"
  description = "Cisco domain"
  dns_resolution = "IPV4_ONLY"
}

# SGT Object
resource "fmc_sgt_objects" "sgt" {
    name = "${var.env_prefix}sgt-object"
    description = "SGT Object"
    tag = "27"
}

# Security Zone
resource "fmc_security_zone" "test" {
  name          = "${var.env_prefix}security-zone"
  interface_mode = "INLINE"
}

# Time Range Object
resource "fmc_time_range_object" "test" {
    name                  = "${var.env_prefix}test-time-range"
    description           = "Test time range"
    effective_start_date = "2019-09-19T15:53:00"
    effective_end_date   = "2050-09-21T17:53:00"
}