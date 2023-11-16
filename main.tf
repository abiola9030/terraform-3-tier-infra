module "vpc" {
    source = "./vpc"
    tags = local.project_tags
}

module "rds" {
    source = "./rds"
    private_subnet1 = module.vpc.private_subnet1_id
    private_subnet2 = module.vpc.private_subnet2_id
    tags = local.project_tags
    vpc_id = module.vpc.vpc_id
    vpc_cidr = "10.0.0.0/16"
}

module "ec2_" {
    source = "./ec2(2)"
    subnet_id = module.vpc.public_subnet1_id
    vpc_id = module.vpc.vpc_id
    tags = local.project_tags
}

# module "ec2" {
#     source = "./ec2"
#     private_subnet_ids = module.vpc.private_subnets_ids
#     tags = local.project_tags
#     vpc_id = module.vpc.vpc_id
#     vpc_cidr_block = ["10.0.0.0/16"]

# }