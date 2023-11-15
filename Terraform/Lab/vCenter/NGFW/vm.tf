
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
    local_ovf_path            = "./OVF/${var.ovf_file}"
    disk_provisioning         = "thin"
    deployment_option = var.deployment_option
    enable_hidden_properties = true
    ovf_network_map           = {
      "GigabitEthernet0-0" = data.vsphere_network.network.id
      "Management0-0"      = data.vsphere_network.network.id
      "GigabitEthernet0-1" = vsphere_distributed_port_group.pg.id
      "GigabitEthernet0-2" = data.vsphere_network.network.id
      "GigabitEthernet0-3" = data.vsphere_network.network.id
      "GigabitEthernet0-4" = data.vsphere_network.network.id
      "GigabitEthernet0-5" = data.vsphere_network.network.id
      "Diagnostic"         = data.vsphere_network.network.id
      "GigabitEthernet0-6" = data.vsphere_network.network.id
      "GigabitEthernet0-7" = data.vsphere_network.network.id
    }
  }
  vapp {
    properties = {
      "fqdn"            = "${var.hostname}.${var.domain_name}"
      "pw"              = var.password
      "ipv4.how"        = var.mgmt_ip4_config
      "ipv4.addr"       = var.mgmt_ip4
      "ipv4.mask"       = var.mgmt_ip4_mask
      "ipv4.gw"         = var.mgmt_ip4_gateway
      "dns1"            = var.dns1
      "searchdomains"   = var.searchdomains
      "firewallmode"    = var.firewall_mode
      "manageLocally"   = var.local_manager
      "mgr"             = var.fmc_ip
      "regkey"          = var.fmc_regkey
    }
  }
}
