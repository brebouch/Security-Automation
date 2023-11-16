################################################################################################
# Data Sources
################################################################################################

# Device
data "fmc_devices" "device" {
    name = var.device_name
}

# Access Policy
data "fmc_access_policies" "acp" {
    name = "FTD ACP"
}

# Device Cluster
data "fmc_device_cluster" "cluster" {
    name = "ftd-cluster1"
}

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

# Dynamic Object
data "fmc_dynamic_object" "dynamic_object" {
    name = "Dynamic Object 1"
}

# Extended ACL
data "fmc_extended_acl" "extended-acl" {
    name = "TEST-ACL"
}

# File Policy
data "fmc_file_policies" "file_policy" {
    name = "AMP Policy"
}

# NAT Policy
data "fmc_ftd_nat_policies" "nat_policy" {
    name = "FTD NATP"
}

# Host Object
data "fmc_host_objects" "host_object" {
    name = "CUCM-Pub"
}

# IPS Policy
data "fmc_ips_policies" "ips_policy" {
  name = "Balanced Security and Connectivity"
}

# SGT Object
data "fmc_ise_sgt_objects" "ise_sgt_object" {
    name = "workstation"
}

# Network Analysis Policy
data "fmc_network_analysis_policies" "network_analysis_policy" {
    name = "AMP Policy"
}

# Network Group Objects
data "fmc_network_group_objects" "network_group_object" {
    name = "network_group_object"
}

# Network Objects
data "fmc_network_objects" "network_object"{
    name = "any-ipv4"
}

# Port Group Objects
data "fmc_port_group_objects" "port_group_object" {
    name = "test-object-group"
}

# Port Objects
data "fmc_port_objects" "http" {
    name = "HTTP"
}

# Security Zone
data "fmc_security_zones" "inside" {
    name = "inside"
}

# SGT Object
data "fmc_sgt_objects" "sgt_object" {
    name = "workstation"
}

# Smart License
data "fmc_smart_license" "smart_license" {}
