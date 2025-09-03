output "nginx_url" {
  value = "http://localhost:${var.host_port}"
}

output "nginx_container_ip" {
  value = docker_container.nginx.network_data[0].ip_address
}

