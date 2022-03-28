locals {
  development = {
    nodered = {
      images   = var.images["nodered"][terraform.workspace]
      ext_port = var.ext_ports.nodered[terraform.workspace]
      int_port = 1880
      volume  = "/home/akingo/Desktop/data/"
    }

    grafana = {
      images   = var.images["grafana"][terraform.workspace]
      ext_port = var.ext_ports.grafana[terraform.workspace]
      int_port = 3000
      volume = "/var/lib/grafana"
    }

    influxdb = {
      images   = var.images["influxdb"][terraform.workspace]
      ext_port = var.ext_ports.influxdb[terraform.workspace]
      int_port = 8086
      volume = "/var/lib/influxdb"
    }
  }
}
