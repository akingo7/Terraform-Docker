locals {
  development = {
    nodered = {
      images   = var.images["nodered"][terraform.workspace]
      ext_port = var.ext_ports.nodered[terraform.workspace]
      int_port = 1880
    }

    grafana = {
      images   = var.images["grafana"][terraform.workspace]
      ext_port = var.ext_ports.grafana[terraform.workspace]
      int_port = 3000
    }

    influxdb = {
      images   = var.images["influxdb"][terraform.workspace]
      ext_port = var.ext_ports.influxdb[terraform.workspace]
      int_port = 8086
    }
  }
}
