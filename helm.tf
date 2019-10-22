resource "helm_release" "wordpress" {
  name    = "wordpress"
  chart   = "stable/wordpress"
  version = "7.5.0"

  depends_on = [kubernetes_cluster_role_binding.tiller_cluster_role_binding]
}
