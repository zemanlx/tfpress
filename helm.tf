resource "helm_release" "wordpress" {
  name    = "wordpress"
  chart   = "stable/wordpress"
  version = "7.5.0"
}
