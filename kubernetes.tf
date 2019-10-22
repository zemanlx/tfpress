resource "kubernetes_service_account" "tiller_service_account" {
  metadata {
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "tiller_cluster_role_binding" {
  metadata {
    name = "tiller"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "kube-system"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "${kubernetes_service_account.tiller_service_account.metadata.0.name}"
    namespace = "kube-system"
  }
}

data "kubernetes_service" "wordpress" {
  metadata {
    name = "wordpress"
  }
}

data "kubernetes_secret" "wordpress" {
  metadata {
    name = "wordpress"
  }
}
