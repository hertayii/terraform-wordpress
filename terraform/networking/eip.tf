resource "aws_eip" "eip" {
  vpc      = true
}
output "eip_id" {
  value       = aws_eip.eip.id
  sensitive   = false
  description = "description"
}
