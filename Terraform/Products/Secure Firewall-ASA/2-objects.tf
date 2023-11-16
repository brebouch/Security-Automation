#########################################
#
# ASA Objects
#
#########################################

####################
# Data Sources
####################

# Network Object
data "ciscoasa_network_object" "network_object" {
  name = "test_ipv4subnet"
}

# All Network Objects
data "ciscoasa_network_objects" "all_network_objects" {}

# Network Service
data "ciscoasa_network_service" "network_service" {
  name = "tcp-port"
}

# All Network Services
data "ciscoasa_network_services" "all_network_services" {}


####################
# Resources
####################

# Network Host Object
resource "ciscoasa_network_object" "ipv4host" {
  name  = "ipv4_host"
  value = "192.168.10.5"
}

# Network Range Object
resource "ciscoasa_network_object" "ipv4range" {
  name  = "ipv4_range"
  value = "192.168.10.5-192.168.10.15"
}

# Network Object
resource "ciscoasa_network_object" "ipv4_subnet" {
  name  = "ipv4_subnet"
  value = "192.168.10.128/25"
}

# Network Object Group
resource "ciscoasa_network_object_group" "network_object_group" {
  name = "my_group"
  members = [
    "192.168.10.15",
    "10.5.10.0/24",
      ciscoasa_network_object.ipv4_subnet.name,
  ]
}

# Network Service
resource "ciscoasa_network_service" "tcp-port" {
  name  = "tcp-port"
  value = "tcp/800"
}

# Network Service with Source
resource "ciscoasa_network_service" "tcp-with-source" {
  name  = "tcp-with-source"
  value = "tcp/https,source=7000-8000"
}

# Network Service with Type Code
resource "ciscoasa_network_service" "icmp4-with-type-code" {
  name  = "icmp4-with-type-code"
  value = "icmp/50/60"
}

# Network Service Group
resource "ciscoasa_network_service_group" "service_group" {
  name = "service_group"

  members = [
    "tcp/80",
    "udp/53",
    "tcp/6001-6500",
    "icmp/0",
  ]
}