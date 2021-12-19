terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {

}
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}
resource "docker_container" "nodered_container" {
  name  = "first_node_container"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}

output "Ip-address" {
  value = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The ip address and port of docker container"
}

output "Container-name" {
  value = docker_container.nodered_container.name
  description = "Name of docker container"
}