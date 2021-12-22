
output "Ip-address" {
  value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address,i.ports[0].external])]
  description = "The ip address and port of docker container"
}

output "Container-name" {
  value = docker_container.nodered_container[*].name
  description = "Name of docker container"
}