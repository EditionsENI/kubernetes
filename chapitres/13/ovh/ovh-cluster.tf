resource "ovh_cloud_project_kube" "k8s_cluster" {
   service_name = var.service_name
   name         = "tofu_test"
   region       = var.region
   version      = "1.29"
   private_network_id = tolist(ovh_cloud_project_network_private.network.regions_attributes[*].openstackid)[0]

   private_network_configuration {
      default_vrack_gateway              = ""
      private_network_routing_as_default = false
   }
   depends_on = [ovh_cloud_project_network_private_subnet.subnet]
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
   service_name  = var.service_name
   kube_id       = ovh_cloud_project_kube.k8s_cluster.id
   name          = "discovery-pool" //Warning: "_" char is not allowed!
   flavor_name   = "d2-8"
   desired_nodes = 1
   max_nodes     = 2
   min_nodes     = 0
}
