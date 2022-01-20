resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  instance_class = var.type
  name           = var.db_name
  username       = var.db_user
  password       = var.db_pass
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.priv_sub_gr.id
}

output "database_host" {
  value       = "aws_db_instance.db_instance.id"
  sensitive   = false
  description = "description"
}
