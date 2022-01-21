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

# output "vpc_id_id" {
#   value = module.network.vpc_id
# }

# output "id" {
#   value = module.network.pub_sub
# }
# output "priv_s" {
#   value = module.network.priv_sub
# }
# output "sg-word" {
#   value = module.ec2-instance.sg-wordpress
# }