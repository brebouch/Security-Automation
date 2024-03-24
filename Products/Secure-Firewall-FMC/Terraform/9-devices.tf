##########################################
#
# Devices
#
##########################################

####################
# Data Sources
####################

# Device
data "fmc_devices" "device" {
    name = "ftd-device-name"
}

# Device Cluster
data "fmc_device_cluster" "cluster" {
    name = "ftd-cluster1"
}

####################
# Resources
####################

# Device
resource "fmc_devices" "ftd" {
    name = "ftd"
    hostname = "<IP ADDR OF HOST>"
    regkey = "<Reg key used in FTD>"
    nat_id = "<NAT ID used in FTD>"
    license_caps = [
        "BASE","MALWARE","THREAT","URLFilter"
    ]
    access_policy {
        id = data.fmc_access_policies.access_policy.id
    }
}

# Devices Bulk
resource "fmc_devices_bulk" "devices" {
    devices {
        name = "ftd"
        hostname = "<IP ADDR OF HOST>"
        regkey = "<Reg key used in FTD>"
        license_caps = [
            "MALWARE"
        ]
        access_policy {
            id = data.fmc_access_policies.access_policy.id
        }
    }
    devices {
        name = "ftd2"
        hostname = "<IP ADDR OF HOST2>"
        regkey = "<Reg key used in FTD2>"
        license_caps = [
            "MALWARE"
        ]
        access_policy {
            id = data.fmc_access_policies.access_policy.id
        }
    }
}

# Device Cluster
 resource "fmc_device_cluster" "cluster" {
    name = "ftd_cluster"
    control_device {
      cluster_node_bootstrap {
        priority = 1
        cclip = "10.10.11.1"
      }
      device_details  {
        id = data.fmc_devices.device1.id
        name = data.fmc_devices.device1.name
      }
    }
    common_bootstrap {
      ccl_interface {
        id = data.fmc_device_physical_interfaces.ccl_physical_interface.id
        name = data.fmc_device_physical_interfaces.ccl_physical_interface.name
      }
      ccl_network = "10.10.11.0/27"
      vni_network = "10.10.10.0/27"
    }
    data_devices{
        cluster_node_bootstrap{
          priority = 2
          cclip = "10.10.11.2"
        }
        device_details{
          id = data.fmc_devices.device2.id
          name = data.fmc_devices.device2.name
        }
    }
    data_devices{
        cluster_node_bootstrap{
          priority = 3
          cclip = "10.10.11.3"
        }
        device_details{
          id = data.fmc_devices.device3.id
          name = data.fmc_devices.device3.name
        }
    }
  }
