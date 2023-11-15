

output "datacenter" {
  value = data.vsphere_datacenter.datacenter
}

output "datastore" {
  value = data.vsphere_datastore.datastore
}

output "host" {
  value = data.vsphere_host.host
}

output "network" {
  value = data.vsphere_network.network
}

output "content_library" {
  value = data.vsphere_content_library.library
}

output "content_item" {
  value = data.vsphere_content_library.library
}
