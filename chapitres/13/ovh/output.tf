resource "local_file" "kubeconfig" {
  content  = ovh_cloud_project_kube.k8s_cluster.kubeconfig
  filename = "${path.module}/kubeconfig"
  file_permission = "0600"
}
