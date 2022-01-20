resource "aws_internet_gateway" "igw" {
  vpc_id     = aws_vpc.wordpress.id
  depends_on = [aws_subnet.public_subnet_cidr]
  tags = {
    Name = "${var.name}-igw"
  }
}

output "igw_id" {
  value       = "aws_internet_gateway.igw.id"
  sensitive   = false
  description = "description"
}
