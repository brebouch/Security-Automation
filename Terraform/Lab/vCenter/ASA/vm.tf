
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
    label = "disk0"
    size = "50"
    attach = true
  }
  cdrom {
    client_device = true
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = vsphere_distributed_port_group.pg.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  extra_config = {
    "numa.vcpu.preferHT" : "TRUE",
    "monitor_control.pseudo_perfctr" : "TRUE"
  }
  ovf_deploy {
    allow_unverified_ssl_cert = true
    local_ovf_path            = var.ovf_file_path
    disk_provisioning         = "thin"
    deployment_option = var.deployment_option
    enable_hidden_properties = true
    configuration = var.deployment_option
    ovf_network_map           = {
      "GigabitEthernet0-0" = data.vsphere_network.network.id
      "GigabitEthernet0-1" = vsphere_distributed_port_group.pg.id
      "GigabitEthernet0-2" = data.vsphere_network.network.id
      "GigabitEthernet0-3" = data.vsphere_network.network.id
      "GigabitEthernet0-4" = data.vsphere_network.network.id
      "GigabitEthernet0-5" = data.vsphere_network.network.id
      "GigabitEthernet0-6" = data.vsphere_network.network.id
      "GigabitEthernet0-7" = data.vsphere_network.network.id
    }
  }
  vapp {
    properties = {
      "Hostname"                              = var.hostname
      "Username"                              = var.username
      "Password"                              = var.password
      "ManagementIPv4"                        = var.mgmt_ip4
      "ManagementIPv4Subnet"                  = var.mgmt_ip4_mask
      "ManagementIPv4DefaultGateway"          = var.mgmt_ip4_gateway
      "DNSServerIPv4"                         = var.dns1
      "RESTEnable"                            = true
      "SSHEnable"                             = true
    }
  }
}


resource "vsphere_virtual_machine" "app_vm" {
  name             = var.virtual_machine
  folder = var.folder
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  host_system_id   = data.vsphere_host.host.id
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus = 2
  memory = 4096
  disk {
    label = "disk0"
    size = "50"
    attach = true
  }
  cdrom {
    datastore_id = "data.vsphere_datastore.datastore.id"
  }
  network_interface {
    network_id = vsphere_distributed_port_group.pg.id
  }
}


