#########################################
#
# Secure Device Connector
#
#########################################

resource "cdo_sdc" "sdc" {
  name = "CDO-SDC"
}

data "cdo_tenant" "current" {}

module "vsphere-cdo-sdc" {
  source               = "CiscoDevNet/cdo-sdc/vsphere"
  version              = "1.0.0"
  vsphere_username     = var.vsphere_user
  vsphere_password     = var.vsphere_password
  vsphere_server       = var.vsphere_server
  datacenter           = data.vsphere_datacenter.datacenter.name
  resource_pool        = var.resource_pool
  cdo_tenant_name      = data.cdo_tenant.current.human_readable_name
  datastore            = data.vsphere_datastore.datastore.name
  network              = data.vsphere_network.network.name
  host                 = var.host
  allow_unverified_ssl = true
  ip_address           = var.sdc_ip
  gateway              = var.sdc_gw
  cdo_user_password    = var.sdc_password
  root_user_password   = var.sdc_password
  cdo_bootstrap_data   = cdo_sdc.sdc.bootstrap_data
}
