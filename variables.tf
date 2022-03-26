variable "images" {
  default = {
    nodered = {
      dev  = "nodered/node-red:latest"
      prod = "nodered/noe-red:minimal"
    }
    influxdb = {
      dev  = "influxdb:2.1.1"
      prod = "influxdb:2.1.1"
    }
    grafana = {
      dev  = "grafana/grafana"
      prod = "grafana/grafana"
    }
  }

}


variable "ext_ports" {

}