terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~>4.5.0"
    }
  }
}

provider "docker" {
  host = "ssh://mysqluser@158.160.191.139"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_container" "mysql" {
  name = "mysql"
  image = docker_image.mysql.image_id
  ports {
    internal = 3306
    external = 3306
  }
  env = [
    "MYSQL_ROOT_PASSWORD=example_${random_password.root_pass.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=example_${random_password.user_pass.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}

resource "docker_image" "mysql" {
  name = "mysql:8"
}

resource "random_password" "root_pass" {
  length = 10
  special = false
  min_upper = 2
  min_lower = 1
  min_numeric = 3
}

resource "random_password" "user_pass" {
  length = 10
  special = false
  min_upper = 1
  min_lower = 2
  min_numeric = 3
}
