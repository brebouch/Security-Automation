
/*
resource "time_sleep" "wait_5_minutes" {
  depends_on = [vsphere_virtual_machine.vm]

  create_duration = "300s"
}
*/


resource "vsphere_virtual_machine" "vm" {
  name             = var.virtual_machine
  folder = var.folder
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  host_system_id   = data.vsphere_host.host.id
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus = var.cpu
  memory = var.memory
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout = 0
  scsi_type = "lsilogic"
  disk {
    label = "vmdisk1"
    attach = true
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  disk {
    label = "vmdisk2"
    attach = true
    datastore_id     = data.vsphere_datastore.datastore.id
  }
  cdrom {
    client_device = true
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = vsphere_distributed_port_group.pg.id
  }
  ovf_deploy {
    local_ovf_path            = var.ovf_file_path
    disk_provisioning         = "thin"
    ip_protocol               = "IPV4"
    ip_allocation_policy      = "STATIC_MANUAL"
  }
  vapp {
    properties = {
      "HARole"                                = "Standalone"
      "Hostname"                              = var.hostname
      "Username"                              = var.username
      "Password"                              = var.password
      "ManagementIPv4"                        = var.mgmt_ip4
      "ManagementIPv4Subnet"                  = var.mgmt_ip4_mask
      "ManagementIPv4DefaultGateway"          = var.mgmt_ip4_gateway
      "DNSServerIPv4"                         = var.dns1
      "RESTEnable"                            = "TRUE"
      "SSHEnable"                             = "TRUE"
    }
  }
}




