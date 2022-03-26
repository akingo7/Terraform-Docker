locals {
  development = {
    nodered = {
      images   = var.images["nodered"][terraform.workspace]
      ext_port = var.ext_ports.nodered[terraform.workspace][0]
      int_port = 1880
    }

    grafana = {
      images   = var.images["grafana"][terraform.workspace]
      ext_port = var.ext_ports.grafana[terraform.workspace][0]
      int_port = 3000
    }

    influxdb = {
      images   = var.images["influxdb"][terraform.workspace]
      ext_port = var.ext_ports.influxdb[terraform.workspace][0]
      int_port = 8086
    }
  }
}


module "image" {
  source        = "./image"
  for_each      = var.images
  image_name_in = each.value[terraform.workspace]
}
resource "random_string" "random" {
  for_each = local.development
  special  = false
  upper    = false
  length   = 4
}
module "container" {
  source   = "./container"
  for_each = local.development
  name_in  = join("-", [each.key, random_string.random[each.key].result])
  image_in = module.image[each.key].image_out
  ext_port = each.value.ext_port
  int_port = each.value.int_port
}