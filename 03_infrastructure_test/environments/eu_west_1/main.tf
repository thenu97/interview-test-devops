module "aws_vpc" {
  source         = "../../modules/vpc"
  vpc_cidr_block = "12.0.0.0/16"
}

module "aws_sg" {
  source = "../../modules/sg"
  name   = "bink_sg"
  vpc_id = module.aws_vpc.vpc_id
}

module "aws_ec2" {
  source        = "../../modules/ec2"
  bink_sg       = ["${module.aws_sg.bink_sg_id}"]
  bink_subnet   = module.aws_vpc.aws_bink_sg_id
  bink_key      = "bink"
  region        = var.region
  image_id      = "ami-0f29c8402f8cce65c"
  instance_type = var.instance_type_input
}

