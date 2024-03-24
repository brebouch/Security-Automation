#########################################
#
# ASA NAT
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# Auto NAT
resource "ciscoasa_nat" "auto_test" {
  section                   = "auto"
  description               = "static auto test"
  mode                      = "static"
  original_interface_name   = ciscoasa_interface_physical.inside.name
  translated_interface_name = ciscoasa_interface_physical.outside.name
  original_source_kind      = "objectRef#NetworkObj"
  original_source_value     = ciscoasa_network_object.inside_host.name
  translated_source_kind    = "objectRef#NetworkObj"
  translated_source_value   = ciscoasa_network_object.inside_host_translated.name
}

# NAT After
resource "ciscoasa_nat" "after_test1" {
  active                     = false
  section                    = "after"
  description                = "dynamic after test 1"
  mode                       = "dynamic"
  position                   = 1
  original_interface_name    = ciscoasa_interface_physical.inside.name
  translated_interface_name  = ciscoasa_interface_physical.outside.name
  original_source_kind       = "objectRef#NetworkObj"
  original_source_value      = ciscoasa_network_object.inside_host.name
  original_destination_kind  = "objectRef#NetworkObj"
  original_destination_value = ciscoasa_network_object.outside_pool.name
  original_service_kind      = "objectRef#TcpUdpServiceObj"
  original_service_value     = ciscoasa_network_service.tcp_port.name
  translated_source_kind     = "objectRef#NetworkObj"
  translated_source_value    = ciscoasa_network_object.host_101.name
  translated_service_kind    = "objectRef#TcpUdpServiceObj"
  translated_service_value   = ciscoasa_network_service.tcp_dns.name
}