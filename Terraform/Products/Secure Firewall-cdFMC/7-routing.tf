########################################################
#
# Routing
#
#########################################################

####################
# Data Sources
####################

data "fmc_staticIPv4_route" "route" {
   device_id = data.fmc_devices.device.id
   network_name = "Random-net"
}

####################
# Resources
####################

# Static IPv4 Route
resource "fmc_staticIPv4_route" "route1" {
    device_id = data.fmc_devices.device.id
    interface_name = "outside"
    is_tunneled = false
    metric_value = 22
    selected_networks {
        id = data.fmc_network_objects.nw.id
        type = data.fmc_network_objects.nw.type
        name = data.fmc_network_objects.nw.name
    gateway {
        object {
            id = data.fmc_host_objects.igw.id
            type = data.fmc_host_objects.igw.type
             name = data.fmc_host_objects.igw.name
        }
    }
}