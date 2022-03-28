
module "image" {
  source        = "./image"
  for_each      = var.images
  image_name_in = each.value[terraform.workspace]
}

module "container" {
  source   = "./container"
  for_each = local.development
  name_in  = each.key
  image_in = module.image[each.key].image_out
  ext_port = each.value.ext_port
  int_port = each.value.int_port
  count_num = length(each.value.ext_port)
  volume_in = each.value.volume
}