resource "aws_main_route_table_association" "from_pub" {
  vpc_id         = aws_vpc.wordpress.id
  route_table_id = aws_route_table.public.id
}