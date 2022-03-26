resource "random_string" "random" {
  count = var.count_num
  special  = false
  upper    = false
  length   = 4
}

resource "docker_container" "container" {
  count = var.count_num
  name  = join("-", [var.name_in, random_string.random[count.index].result])
  image = var.image_in
  ports {
    external = var.ext_port[count.index]
    internal = var.int_port
  }

}
