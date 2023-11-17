
# Create Virtual Switch

resource "vsphere_distributed_virtual_switch" "switch" {
  name           = var.virtual_switch
  datacenter_id = data.vsphere_datacenter.datacenter.id
  host {
    devices        = []
    host_system_id = data.vsphere_host.host.id
  }
}

# Create Virtual Port Group
resource "vsphere_distributed_port_group" "pg" {
  name                = var.virtual_port_group
  distributed_virtual_switch_uuid = vsphere_distributed_virtual_switch.switch.id
}
