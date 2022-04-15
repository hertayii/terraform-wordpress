terraform {
  backend "s3" {
    bucket = "terraform.state.for.me"
    key    = "./terraform.state"
    region = "us-east-1"
  }
}


module "network" {
  source = "./networking"
  name   = "wordpress"
}

module "ec2-instance" {
  source     = "./ec2-instance"
  name       = "wordpress"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.pub_sub
}


module "rds-instance" {
  source      = "./rds"
  vpc_id      = module.network.vpc_id
  wordp_sg    = [module.ec2-instance.sg-wordpress]
  private_sub = module.network.priv_sub
}


output "vpc_id" {
  value       = module.network.vpc_id
  sensitive   = false
  description = "description"
  depends_on  = []
}
