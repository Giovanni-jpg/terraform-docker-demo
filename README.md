# Terraform Docker Demo

This project is a simple hands-on exercise with [Terraform](https://developer.hashicorp.com/terraform) using the [Docker provider](https://registry.terraform.io/providers/kreuzwerker/docker/latest).

It demonstrates how to:
- Install and initialize Terraform
- Use the Docker provider
- Deploy an **Nginx** container
- Work with `terraform plan`, `apply`, and `destroy`
- Use **variables** and **outputs**

---

##  Getting Started

### 1. Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed  
- [Docker](https://docs.docker.com/get-docker/) running on your machine  

Check installations:
```bash
terraform -version
docker --version
```

---

### 2. Clone the Repository

```bash
git clone https://github.com/<your-username>/terraform-docker-demo.git
cd terraform-docker-demo
```

---

### 3. Initialize Terraform

```bash
terraform init
```

---

### 4. Review Plan

```bash
terraform plan
```

---

### 5. Apply Configuration

```bash
terraform apply -auto-approve
```

This will:

* Pull the latest **Nginx** image
* Start a container named `my-nginx` (default)
* Expose it on port `8081` (default)

Test in browser: [http://localhost:8081](http://localhost:8081)

---

### 6. Destroy Resources

```bash
terraform destroy -auto-approve
```

---

##  Variables

You can customize the container name and port in `variables.tf`:

```hcl
variable "container_name" {
  default = "my-nginx"
}

variable "host_port" {
  default = 8081
}
```

Override at runtime:

```bash
terraform apply -var="container_name=demo-nginx" -var="host_port=9090"
```

---

## Outputs

After apply, Terraform will print the container URL:

```hcl
output "nginx_url" {
  value = "http://localhost:${var.host_port}"
}
```

Example output:

```
Outputs:

nginx_url = http://localhost:8081
```

---

##  Cleanup

To stop and remove the container and image:

```bash
terraform destroy -auto-approve
```

---

##  Resources

* [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
* [Docker Provider Docs](https://registry.terraform.io/providers/kreuzwerker/docker/latest)

---

That’s it! You now have a working Terraform + Docker demo.
