resource "ovh_cloud_project_network_private" "network" {
  service_name = var.service_name
  name         = "k8s_private_network"
  regions      = [var.region]
  provider     = ovh
  vlan_id      = 168
}

resource "ovh_cloud_project_network_private_subnet" "subnet" {
  service_name = var.service_name
  # Identifiant de la ressource ovh_cloud_network_private nommée network
  network_id   = ovh_cloud_project_network_private.network.id
  start        = "192.168.168.10"
  end          = "192.168.168.250"
  network      = "192.168.168.0/24"
  dhcp         = true
  region       = var.region
  provider     = ovh
  no_gateway   = true
}
