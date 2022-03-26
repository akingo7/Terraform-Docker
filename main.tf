
module "image" {
  source = "./image"
}

resource "docker_image" "nodered" {
#   name = "nodered/node-red:latest"
    # name = "grafana/grafana"
    name = "influxdb:2.1.1"
}

resource "docker_container" "container" {
    name = "container"
    image = docker_image.nodered.name
    ports {
        internal = 8086
        external = 8086
    }
  
}
 output "first" {
     value = docker_container.container.ip_address
 }