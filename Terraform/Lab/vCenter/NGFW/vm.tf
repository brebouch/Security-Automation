
resource "vsphere_virtual_machine" "vm" {
  name = var.virtual_machine
  resource_pool_id = vsphere_resource_pool.rp.id
  host_system_id = data.vsphere_host.host.id
  datastore_id = data.vsphere_datastore.datastore.id
  num_cpus = var.cpu
  memory = var.memory
  scsi_type = "lsilogic"
  disk {
    label = "disk0"
    size = 40
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
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  extra_config = {
    "numa.vcpu.preferHT": "TRUE",
    "monitor_control.pseudo_perfctr": "TRUE"
  }
  ovf_deploy {
    allow_unverified_ssl_cert = true
    local_ovf_path    = "/${var.datacenter}/datastore/ISOs/${var.content_library_item}/${var.content_library_item}.ovf"
    disk_provisioning    = "thin"
    ip_protocol          = "IPV4"
    ip_allocation_policy = "STATIC_MANUAL"
    ovf_network_map = {
      "GigabitEthernet0-0" = data.vsphere_network.network.id
      "Management0-0" = data.vsphere_network.network.id
      "GigabitEthernet0-1" = data.vsphere_network.network.id
      "GigabitEthernet0-2" = data.vsphere_network.network.id
      "GigabitEthernet0-3" = data.vsphere_network.network.id
      "GigabitEthernet0-4" = data.vsphere_network.network.id
      "GigabitEthernet0-5" = data.vsphere_network.network.id
      "Diagnostic" = data.vsphere_network.network.id
      "GigabitEthernet0-6" = data.vsphere_network.network.id
      "GigabitEthernet0-7" = data.vsphere_network.network.id
    }
  }
  vapp {
    properties = {
      "pw"    = var.password,
      "ipv4.how" = var.mgmt_ip4_config,
      "ipv4.addr" = var.mgmt_ip4,
      "ipv4.gw" = var.mgmt_ip4_gateway,
      "ipv4.mask" = var.mgmt_ip4_mask,
      "ipv6.how" = var.mgmt_ip6_config,
      "ipv6.addr" = var.mgmt_ip6,
      "ipv6.gw" = var.mgmt_ip6_gateway,
      "ipv6.mask" = var.mgmt_ip6_mask,
      "fqdn" = var.hostname,
      "firewallmode" = var.firewall_mode,
      "dns1" = var.dns1,
      "dns2" = var.dns2,
      "dns3" = var.dns3,
      "manageLocally" = var.local_manager,
      "mgr" = var.fmc_ip,
      "regkey" = var.fmc_regkey,
      "regNAT" = var.fmc_nat_id,
      "searchdomains" = var.searchdomains
    }
  }
}