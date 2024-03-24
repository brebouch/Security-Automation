#########################################
#
# ASA Misc Services
#
#########################################

####################
# Data Sources
####################

# No Data Sources

####################
# Resources
####################

# System Backup
resource "ciscoasa_backup" "backup" {
  passphrase = "123456"
  location   = "disk0:/backup.cfg"
}

# NTP Server
resource "ciscoasa_ntp_server" "ntp_test" {
  ip_address = "2.2.2.2"
  interface  = "inside"
  key_number = "3"
  key_value  = "test3"
  preferred  = true
}

# Time Range
resource "ciscoasa_timerange" "tr" {
  name = "tr"
  value {
    start = "now"
    end   = "03:47 May 14 2025"
    periodic {
      frequency    = "Wednesday to Thursday"
      start_hour   = 4
      start_minute = 3
      end_hour     = 23
      end_minute   = 59
    }
  }
}

# Save Config
resource "ciscoasa_write_memory" "write_memory" {
    triggers = {
        ciscoasa_static_route.ipv4_static_route = jsonencode(ciscoasa_static_route.ipv4_static_route)
    }
}