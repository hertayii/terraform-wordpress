resource "aws_nat_gateway" "nat_gtw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet_cidr[1].id

  tags = {
    Name = "${var.name}-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.nat_gtw.id
  sensitive   = false
  description = "description"
}
