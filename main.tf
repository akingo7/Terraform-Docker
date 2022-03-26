locals {
  development = {
    nodered = {
      images   = var.images.nodered[terraform.workspace]
      ext_port = keys(var.ext_ports.nodered[terraform.workspace])
      int_port = 1880
    }

    grafana = {
      images   = var.images.grafana[terraform.workspace]
      ext_port = keys(var.ext_ports.grafana[terraform.workspace])
      int_port = 3000
    }

    influxdb = {
      images   = var.images.influxdb[terraform.workspace]
      ext_port = keys(var.ext_ports.influxdb[terraform.workspace][*])
      int_port = 8086
    }
  }
}


module "image" {
  source        = "./image"
  for_each      = var.images
  image_name_in = each.value[terraform.workspace]
}


module "container" {
  source   = "./container"
  for_each = local.development
  name_in  = "${each.value.images}"
  image_in = each.value.images
  ext_port = each.value.ext_port
  int_port = each.value.int_port
}