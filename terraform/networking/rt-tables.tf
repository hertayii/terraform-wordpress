/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id     = aws_vpc.wordpress.id
  depends_on = [aws_subnet.private_subnet_cidr]
  tags = {
    Name = "${var.name}-public-route-table"
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_subnet.public_subnet_cidr]
}
/* Routing table for private subnet */
resource "aws_route_table" "private" {
  vpc_id     = aws_vpc.wordpress.id
  depends_on = [aws_subnet.public_subnet_cidr]
  tags = {
    Name = "${var.name}-private-route-table"
  }
}
resource "aws_route" "nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gtw.id
  depends_on             = [aws_subnet.private_subnet_cidr]
}

output "pub-rt" {
  value       = aws_route_table.public.id
  sensitive   = false
  description = "description"
  depends_on  = []
}
output "prv-rt" {
  value       = aws_route_table.private.id
  sensitive   = false
  description = "description"
  depends_on  = []
}

