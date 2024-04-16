#main.tf (module reference)

# module "resource_group" {
#   source     = "/home/n01521961/automation/terraform/lab6/modules/resource_group"
#   network_Rg = var.network_Rg
#   linux_Rg   = var.linux_Rg
#   windows_Rg = var.windows_Rg
#   location   = var.location
# }



module "resource_group" {
  source = "/home/n01521961/automation/terraform/lab6/modules/resource_group"

  network-Rg = "network-Rg"
  linux-Rg   = "linux-Rg"
  windows-Rg = "windows-Rg"
  location   = "UK West"

}









module "network" {
  source              = "/home/n01521961/automation/terraform/lab6/modules/network"
  network_Rg_location = module.resource_group.network_Rg_location
  network_Rg_name     = module.resource_group.network_Rg_name
}

module "linux" {
  source            = "/home/n01521961/automation/terraform/lab6/modules/linux"
  linux_Rg_location = module.resource_group.linux_Rg_location
  linux_Rg_name     = module.resource_group.linux_Rg_name
  subnet1_id        = module.network.subnet1_id
}

module "windows" {
  source              = "/home/n01521961/automation/terraform/lab6/modules/windows"
  windows_Rg_location = module.resource_group.windows_Rg_location
  windows_Rg_name     = module.resource_group.windows_Rg_name
  subnet2_id          = module.network.subnet2_id
}

