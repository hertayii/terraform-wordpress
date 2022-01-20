resource "aws_db_subnet_group" "priv_sub_gr" {
  name       = "db-subnet-group"
  subnet_ids = var.private_sub

  tags = {
    Name = "My DB subnet group"
  }
}
output "db_sub_group" {
  value       = "aws_db_subnet_group.priv-sub_gr.id"
  sensitive   = false
  description = "description"
}
