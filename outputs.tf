output "wordpress_user_name" {
  value = "user"
}

output "wordpress_user_password" {
  value = data.kubernetes_secret.wordpress.data.wordpress-password
}

output "wordpress_URL" {
  value = "https://${data.kubernetes_service.wordpress.load_balancer_ingress.0.ip}"
}
