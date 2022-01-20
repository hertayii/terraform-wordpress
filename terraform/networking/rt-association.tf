/* Route table associations */
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet_cidr[count.index].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet_cidr[count.index].id
  route_table_id = aws_route_table.private.id
}

output "rt_pub_assoc_id" {
  value       = aws_route_table_association.public
  sensitive   = false
  description = "description"
  depends_on  = []
}
output "rt_prv_assoc_id" {
  value       = aws_route_table_association.private
  sensitive   = false
  description = "description"
  depends_on  = []
}

  