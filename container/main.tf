resource "docker_container" "container" {
  name  = var.name_in
  image = var.image_in
  ports {
    external = var.ext_port
    internal = var.int_port
  }

}