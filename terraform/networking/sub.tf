data "aws_availability_zones" "available" {}

/* Subnets */
resource "aws_subnet" "public_subnet_cidr" {
  vpc_id                  = aws_vpc.wordpress.id
  count                   = 3
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.wordpress]
  tags = {
    Name = "${var.name}-${count.index + 1}-pub-sub"
  }
}
resource "aws_subnet" "private_subnet_cidr" {
  vpc_id                  = aws_vpc.wordpress.id
  count                   = 3
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index + 10)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  depends_on              = [aws_vpc.wordpress]
  tags = {
    Name = "${var.name}-${count.index + 1}-priv-sub"
  }
}

output "priv_sub" {
  value = aws_subnet.private_subnet_cidr.*.id
}
output "pub_sub" {
  value = aws_subnet.public_subnet_cidr.*.id
}
