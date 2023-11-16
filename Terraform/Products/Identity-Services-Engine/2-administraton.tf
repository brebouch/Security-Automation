#########################################
#
# ISE Administration
#
#########################################

####################
# Data Sources
####################

# Certificate Authentication Profile
data "ise_certificate_authentication_profile" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional"
}

# Endpoint Identity Group
data "ise_endpoint_identity_group" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Endpoint Identity Group Name"
}

# Internal User
data "ise_internal_user" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Username"
}

# License Tier State
data "ise_license_tier_state" "example" {
  id = "76d24097-41c4-4558-a4d0-a8c07ac08470"
}

# Network Device
data "ise_network_device" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of Device"
}

# Network Device Group
data "ise_network_device_group" "example" {
    id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of Device Group"
}

# Repository
data "ise_repository" "example" {
    id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
    name = "Optional - Name of repo"
}

# User Identity Group
data "ise_user_identity_group" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of user identity group"
}

####################
# Resources
####################

# Certificate Authentication Profile
resource "ise_certificate_authentication_profile" "example" {
  name                         = "CertProf1"
  description                  = "My cert profile"
  allowed_as_user_name         = false
  external_identity_store_name = "[not applicable]"
  certificate_attribute_name   = "SUBJECT_COMMON_NAME"
  match_mode                   = "NEVER"
  username_from                = "CERTIFICATE"
}

# Endpoint Identity Group
resource "ise_endpoint_identity_group" "example" {
  name           = "Group1"
  description    = "My endpoint identity group"
  system_defined = false
}

# Internal User
resource "ise_internal_user" "example" {
  name                   = "UserTF"
  password               = "Cisco123"
  change_password        = true
  email                  = "aaa@cisco.com"
  account_name_alias     = "User 1"
  enable_password        = "Cisco123"
  enabled                = true
  password_never_expires = false
  first_name             = "John"
  last_name              = "Doe"
  password_id_store      = "Internal Users"
  description            = "My first Terraform user"
}

# License Tier State
resource "ise_license_tier_state" "example" {
  licenses = [
    {
      name   = "ESSENTIAL"
      status = "ENABLED"
    }
  ]
}

# Network Devices
resource "ise_network_device" "example" {
  name                                          = "Device1"
  description                                   = "My device"
  authentication_enable_key_wrap                = true
  authentication_encryption_key                 = "cisco123cisco123"
  authentication_encryption_key_format          = "ASCII"
  authentication_message_authenticator_code_key = "cisco123cisco1235678"
  authentication_network_protocol               = "RADIUS"
  authentication_radius_shared_secret           = "cisco123"
  authentication_enable_multi_secret            = true
  authentication_second_radius_shared_secret    = "cisco12345"
  authentication_dtls_required                  = true
  coa_port                                      = 12345
  dtls_dns_name                                 = "cisco.com"
  ips = [
    {
      ipaddress = "2.3.4.5"
      mask      = "32"
    }
  ]
  model_name                                                  = "Unknown"
  software_version                                            = "Unknown"
  profile_name                                                = "Cisco"
  snmp_link_trap_query                                        = true
  snmp_mac_trap_query                                         = true
  snmp_polling_interval                                       = 1200
  snmp_ro_community                                           = "rocom"
  snmp_version                                                = "TWO_C"
  tacacs_connect_mode_options                                 = "OFF"
  tacacs_shared_secret                                        = "cisco123"
  trustsec_device_id                                          = "device123"
  trustsec_device_password                                    = "cisco123"
  trustsec_rest_api_username                                  = "user123"
  trustsec_rest_api_password                                  = "Cisco123"
  trustsec_enable_mode_password                               = "cisco123"
  trustsec_exec_mode_password                                 = "cisco123"
  trustsec_exec_mode_username                                 = "user456"
  trustsec_include_when_deploying_sgt_updates                 = true
  trustsec_download_enviroment_data_every_x_seconds           = 1000
  trustsec_download_peer_authorization_policy_every_x_seconds = 1000
  trustsec_download_sgacl_lists_every_x_seconds               = 1000
  trustsec_other_sga_devices_to_trust_this_device             = true
  trustsec_re_authentication_every_x_seconds                  = 1000
  trustsec_send_configuration_to_device                       = true
  trustsec_send_configuration_to_device_using                 = "ENABLE_USING_COA"
}

# Network Device Group
resource "ise_network_device_group" "example" {
  name        = "Device Type#All Device Types#Group1"
  description = "My network device group"
  root_group  = "Device Type"
}

# ISE Repository
resource "ise_repository" "example" {
  name        = "repo1"
  protocol    = "SFTP"
  path        = "/dir"
  server_name = "server1"
  user_name   = "user9"
  password    = "cisco123"
  enable_pki  = false
}

# ISE User Identity Group
resource "ise_user_identity_group" "example" {
  name        = "Group1"
  description = "My endpoint identity group"
  parent      = "NAC Group:NAC:IdentityGroups:User Identity Groups"
}