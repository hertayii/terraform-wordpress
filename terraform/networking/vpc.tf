/*==== The VPC ======*/
resource "aws_vpc" "wordpress" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.name}-vpc"
  }
}
output "vpc_id" {
  value       = aws_vpc.wordpress.id
  sensitive   = false
  description = "Retrieveing VPC_ID of wordpress"
  depends_on  = [aws_vpc.wordpress]
}

