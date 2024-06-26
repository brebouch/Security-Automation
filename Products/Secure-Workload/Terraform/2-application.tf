#########################################
#
# Secure Workload Applications
#
#########################################

####################
# Data Sources
####################

# Application
data "tetration_application" "application" {}

####################
# Resources
####################

# Secure Workload Application
resource "tetration_application" "application" {
  app_scope_id         = "5ed6890c497d4f55eb5c585c"
  name                 = "Product Service"
  description          = "A socially distant application"
  alternate_query_mode = true
  strict_validation    = true
  primary              = true
  cluster {
    id          = "ClusterA"
    name        = "ClusterA"
    description = "A Cluster."
    node {
      name       = "ClusterA Node1"
      ip_address = "10.0.0.1"
    }
    consistent_uuid = "ClusterA"
  }
  cluster {
    id          = "ClusterB"
    name        = "ClusterB"
    description = "B Cluster."
    node {
      name       = "ClusterB Node1"
      ip_address = "10.0.0.1"
    }
    node {
      name       = "ClusterB Node2"
      ip_address = "10.0.0.2"
    }
    consistent_uuid = "ClusterB"
  }
  filter {
    id    = "FilterA"
    name  = "DisplayedClusterName"
    query = <<EOF
            {
              "type": "eq",
              "field": "ip",
              "value": "10.0.0.1"
            }
          EOF
  }
  filter {
    id    = "FilterB"
    name  = "DisplayedClusterName2"
    query = <<EOF
            {
              "type": "eq",
              "field": "ip",
              "value": "10.0.0.1"
            }
          EOF
  }
  absolute_policy {
    consumer_filter_id = "5ed68d36497d4f06fc5c5869"
    provider_filter_id = "5ed68d36497d4f06fc5c5869"
    action             = "ALLOW"
    layer_4_network_policy {
      port_range = [80, 80]
      protocol   = 6
    }
  }
  absolute_policy {
    consumer_filter_id = "5ed68d36497d4f06fc5c5869"
    provider_filter_id = "5ed68d36497d4f06fc5c5869"
    action             = "ALLOW"
    layer_4_network_policy {
      port_range = [443, 443]
      protocol   = 6
    }
  }
  default_policy {
    consumer_filter_id = "5ed68d36497d4f06fc5c5869"
    provider_filter_id = "5ed68d36497d4f06fc5c5869"
    action             = "DENY"
    layer_4_network_policy {
      port_range = [8080, 8080]
      protocol   = 6
    }
  }
  default_policy {
    consumer_filter_id = "5ed68d36497d4f06fc5c5869"
    provider_filter_id = "5ed68d36497d4f06fc5c5869"
    action             = "DENY"
    layer_4_network_policy {
      port_range = [8000, 8000]
      protocol   = 6
    }
  }
  catch_all_action = "DENY"
}

# Application Filter By Scope
resource "tetration_application" "application" {
  app_scope_id         = "5ed6890c497d4f55eb5c585c"
  name                 = "Product Service"
  description          = "A socially distant application"
  alternate_query_mode = true
  strict_validation    = true
  primary              = false
  cluster {
    id          = "ClusterA"
    name        = "ClusterA"
    description = "A Cluster."
    node {
      name       = "ClusterA Node1"
      ip_address = "10.0.0.1"
    }
    consistent_uuid = "ClusterA"
  }
  cluster {
    id          = "ClusterB"
    name        = "ClusterB"
    description = "B Cluster."
    node {
      name       = "ClusterB Node1"
      ip_address = "10.0.0.1"
    }
    node {
      name       = "ClusterB Node2"
      ip_address = "10.0.0.2"
    }
    consistent_uuid = "ClusterB"
  }
  filter {
    id    = "FilterA"
    name  = "DisplayedClusterName"
    query = <<EOF
            {
              "type": "eq",
              "field": "ip",
              "value": "10.0.0.1"
            }
          EOF
  }
  filter {
    id    = "FilterB"
    name  = "DisplayedClusterName2"
    query = <<EOF
            {
              "type": "eq",
              "field": "ip",
              "value": "10.0.0.1"
            }
          EOF
  }
  absolute_policy {
    consumer_filter_name = "Development Workloads"
    provider_scope_name  = "AWS"
    action               = "ALLOW"
    layer_4_network_policy {
      port_range = [80, 80]
      protocol   = 6
    }
  }
  absolute_policy {
    consumer_filter_name = "Development Workloads"
    provider_scope_name  = "AWS"
    action               = "ALLOW"
    layer_4_network_policy {
      port_range = [443, 443]
      protocol   = 6
    }
  }
  default_policy {
    consumer_filter_name = "Development Workloads"
    provider_scope_name  = "AWS"
    action               = "DENY"
    layer_4_network_policy {
      port_range = [8080, 8080]
      protocol   = 6
    }
  }
  default_policy {
    consumer_filter_name = "Development Workloads"
    provider_scope_name  = "AWS"
    action               = "DENY"
    layer_4_network_policy {
      port_range = [8000, 8000]
      protocol   = 6
    }
  }
  catch_all_action = "DENY"
}