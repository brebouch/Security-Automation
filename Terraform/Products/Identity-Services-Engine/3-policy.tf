#########################################
#
# ISE Policy
#
#########################################

####################
# Data Sources
####################

# Allowed Protocols
data "ise_allowed_protocols" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of allowed protocols"
}

# Authorization Profile
data "ise_authorization_profile" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of authorization profile"
}

# Network Access Authentication Rule
data "ise_network_access_authentication_rule" "example" {
  policy_set_id = "Required - d82952cb-b901-4b09-b363-5ebf39bdbaf9"
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of authentication rule"
}

# Network Access Authorization Rule
data "ise_network_access_authorization_rule" "example" {
  policy_set_id = "Required - d82952cb-b901-4b09-b363-5ebf39bdbaf9"
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of authorization rule"
}

# Network Access Condition
data "ise_network_access_condition" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of network access condition"
}

# Network Access Dictionary
data "ise_network_access_dictionary" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of network access dictionary"
}

# Network Access Policy Set
data "ise_network_access_policy_set" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of network access policy set"
}

# Network Access Time and Date Condition
data "ise_network_access_time_and_date_condition" "example" {
  id = "Optional - 76d24097-41c4-4558-a4d0-a8c07ac08470"
  name = "Optional - Name of network access time and date condition"
}

####################
# Resources
####################

# Allowed Protocols
resource "ise_allowed_protocols" "example" {
  name                                              = "Protocols1"
  description                                       = "My allowed protocols"
  process_host_lookup                               = true
  allow_pap_ascii                                   = true
  allow_chap                                        = true
  allow_ms_chap_v1                                  = true
  allow_ms_chap_v2                                  = true
  allow_eap_md5                                     = true
  allow_leap                                        = true
  allow_eap_tls                                     = true
  allow_eap_ttls                                    = true
  allow_eap_fast                                    = true
  allow_peap                                        = true
  allow_teap                                        = true
  allow_preferred_eap_protocol                      = true
  preferred_eap_protocol                            = "LEAP"
  eap_tls_l_bit                                     = true
  allow_weak_ciphers_for_eap                        = true
  require_message_auth                              = true
  eap_tls_allow_auth_of_expired_certs               = true
  eap_tls_enable_stateless_session_resume           = true
  eap_tls_session_ticket_ttl                        = 5
  eap_tls_session_ticket_ttl_unit                   = "DAYS"
  eap_tls_session_ticket_percentage                 = 5
  peap_allow_peap_eap_ms_chap_v2                    = true
  peap_allow_peap_eap_ms_chap_v2_pwd_change         = true
  peap_allow_peap_eap_ms_chap_v2_pwd_change_retries = 3
  peap_allow_peap_eap_gtc                           = true
  peap_allow_peap_eap_gtc_pwd_change                = true
  peap_allow_peap_eap_gtc_pwd_change_retries        = 3
  peap_allow_peap_eap_tls                           = true
  peap_allow_peap_eap_tls_auth_of_expired_certs     = true
  require_cryptobinding                             = true
  peap_peap_v0                                      = true
  eap_ttls_pap_ascii                                = true
  eap_ttls_chap                                     = true
  eap_ttls_ms_chap_v1                               = true
  eap_ttls_ms_chap_v2                               = true
  eap_ttls_eap_md5                                  = true
  eap_ttls_eap_ms_chap_v2                           = true
  eap_ttls_eap_ms_chap_v2_pwd_change                = true
  eap_ttls_eap_ms_chap_v2_pwd_change_retries        = 3
  eap_fast_eap_ms_chap_v2                           = true
  eap_fast_eap_ms_chap_v2_pwd_change                = true
  eap_fast_eap_ms_chap_v2_pwd_change_retries        = 3
  eap_fast_eap_gtc                                  = true
  eap_fast_eap_gtc_pwd_change                       = true
  eap_fast_eap_gtc_pwd_change_retries               = 3
  eap_fast_eap_tls                                  = true
  eap_fast_eap_tls_auth_of_expired_certs            = true
  eap_fast_enable_eap_chaining                      = true
  eap_fast_use_pacs                                 = true
  eap_fast_pacs_tunnel_pac_ttl                      = 5
  eap_fast_pacs_tunnel_pac_ttl_unit                 = "DAYS"
  eap_fast_pacs_use_proactive_pac_update_percentage = 5
  eap_fast_pacs_allow_anonymous_provisioning        = true
  eap_fast_pacs_allow_authenticated_provisioning    = true
  eap_fast_pacs_server_returns                      = true
  eap_fast_pacs_allow_client_cert                   = true
  eap_fast_pacs_allow_machine_authentication        = true
  eap_fast_pacs_machine_pac_ttl                     = 5
  eap_fast_pacs_machine_pac_ttl_unit                = "DAYS"
  eap_fast_pacs_stateless_session_resume            = true
  eap_fast_pacs_authorization_pac_ttl               = 5
  eap_fast_pacs_authorization_pac_ttl_unit          = "HOURS"
  teap_eap_ms_chap_v2                               = true
  teap_eap_ms_chap_v2_pwd_change                    = true
  teap_eap_ms_chap_v2_pwd_change_retries            = 3
  teap_eap_tls                                      = true
  teap_eap_tls_auth_of_expired_certs                = true
  teap_eap_accept_client_cert_during_tunnel_est     = true
  teap_eap_chaining                                 = true
  teap_downgrade_msk                                = true
  teap_request_basic_pwd_auth                       = true
  allow_5g                                          = true
}

# Authorization Profile
resource "ise_authorization_profile" "example" {
  name                                                  = "AuthzProfile1"
  description                                           = "My Authorization Profile"
  vlan_name_id                                          = "VLAN10"
  vlan_tag_id                                           = 0
  web_redirection_type                                  = "CentralizedWebAuth"
  web_redirection_acl                                   = "TEST_ACL"
  web_redirection_portal_name                           = "Sponsored Guest Portal (default)"
  web_redirection_static_ip_host_name_fqdn              = "1.2.3.4"
  web_redirection_display_certificates_renewal_messages = true
  agentless_posture                                     = false
  access_type                                           = "ACCESS_ACCEPT"
  profile_name                                          = "Cisco"
  airespace_acl                                         = "ACL1"
  acl                                                   = "ACL1"
  auto_smart_port                                       = "PROFILE1"
  interface_template                                    = "TEMP1"
  ipv6_acl_filter                                       = "ACL1"
  avc_profile                                           = "PROF1"
  asa_vpn                                               = "1"
  unique_identifier                                     = "ID1234"
  track_movement                                        = false
  service_template                                      = false
  easywired_session_candidate                           = false
  voice_domain_permission                               = false
  neat                                                  = false
  web_auth                                              = false
  mac_sec_policy                                        = "MUST_SECURE"
  reauthentication_connectivity                         = "DEFAULT"
  reauthentication_timer                                = 1
  advanced_attributes = [
    {
      attribute_1_value_type      = "AdvancedDictionaryAttribute"
      attribute_1_dictionary_name = "Cisco"
      attribute_1_name            = "cisco-av-pair"
      attribute_2_value_type      = "AttributeValue"
      attribute_2_value           = "set_nadprofile_vlan=true,vlan=TEST,tag=1"
    }
  ]
  airespace_ipv6_acl = "ACL1"
}

# Network Access Authentication Rule
resource "ise_network_access_authentication_rule" "example" {
  policy_set_id             = "d82952cb-b901-4b09-b363-5ebf39bdbaf9"
  name                      = "Rule1"
  default                   = false
  rank                      = 0
  state                     = "enabled"
  condition_type            = "ConditionAttributes"
  condition_is_negate       = false
  condition_attribute_name  = "Location"
  condition_attribute_value = "All Locations"
  condition_dictionary_name = "DEVICE"
  condition_operator        = "equals"
  identity_source_name      = "Internal Endpoints"
  if_auth_fail              = "REJECT"
  if_process_fail           = "DROP"
  if_user_not_found         = "REJECT"
}


# Network Access Authorization Rule
resource "ise_network_access_authorization_rule" "example" {
  policy_set_id             = "d82952cb-b901-4b09-b363-5ebf39bdbaf9"
  name                      = "Rule1"
  default                   = false
  rank                      = 0
  state                     = "enabled"
  condition_type            = "ConditionAttributes"
  condition_is_negate       = false
  condition_attribute_name  = "Location"
  condition_attribute_value = "All Locations"
  condition_dictionary_name = "DEVICE"
  condition_operator        = "equals"
  profile                   = ["PermitAccess"]
  security_group            = "BYOD"
}


# Network Access Condition
resource "ise_network_access_condition" "example" {
  name            = "Cond1"
  description     = "My description"
  condition_type  = "LibraryConditionAttributes"
  is_negate       = false
  attribute_name  = "EapAuthentication"
  attribute_value = "EAP-TLS"
  dictionary_name = "Network Access"
  operator        = "equals"
}


# Network Access Dictionary
resource "ise_network_access_dictionary" "example" {
  name                 = "Dict1"
  description          = "My description"
  version              = "1.1"
  dictionary_attr_type = "ENTITY_ATTR"
}


# Network Access Policy Set
resource "ise_network_access_policy_set" "example" {
  name                      = "PolicySet1"
  description               = "My description"
  is_proxy                  = false
  rank                      = 0
  service_name              = "Default Network Access"
  state                     = "enabled"
  condition_type            = "ConditionAttributes"
  condition_is_negate       = false
  condition_attribute_name  = "Location"
  condition_attribute_value = "All Locations"
  condition_dictionary_name = "DEVICE"
  condition_operator        = "equals"
}


# Network Access Time and Date Condition
resource "ise_network_access_time_and_date_condition" "example" {
  name                 = "Cond1"
  description          = "My description"
  is_negate            = false
  week_days            = ["Monday"]
  week_days_exception  = ["Tuesday"]
  start_date           = "2022-05-06"
  end_date             = "2022-05-10"
  exception_start_date = "2022-06-06"
  exception_end_date   = "2022-06-10"
  start_time           = "08:00"
  end_time             = "15:00"
  exception_start_time = "20:00"
  exception_end_time   = "22:00"
}