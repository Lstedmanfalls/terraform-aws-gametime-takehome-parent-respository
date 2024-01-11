provider "aws" {
  region = var.region
}

module "network" {
  source       = "./modules/network"
  project_name = var.project_name
  environment  = var.environment
  az           = var.az
}

module "ec2" {
  source        = "./modules/ec2"
  project_name  = var.project_name
  environment   = var.environment
  az            = var.az
  instance_name = var.instance_name
  instance_type = var.instance_type
  num_instances = var.num_instances
  monitoring    = var.monitoring
  subnet_id     = module.network.subnet_id
  vpc_sg_ids    = [module.network.sg_id]
  depends_on    = [module.network]
}

# module "iam" {
#   source = "./modules/iam"
# }
