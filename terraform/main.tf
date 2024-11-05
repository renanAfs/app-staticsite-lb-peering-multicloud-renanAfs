module "aws-network" {
 source = "./aws/modules/network"
}
module "azure-network" {
 source = "./azure/modules/network"
}
module "aws-compute" {
 source = "./aws/modules/compute"
}
module "azure-compute" {
 source = "./azure/modules/compute"
}