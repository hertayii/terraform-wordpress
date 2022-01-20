resource "aws_security_group" "rds" {
  name        = var.rds_sg
  description = "Allow TLS inbound traffic from WordpresssSG "
  vpc_id      = var.vpc_id

  ingress {
    description     = "TLS from VPC"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.wordp_sg
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.rds_sg
  }
}
output "sg-rds" {
  value     = aws_security_group.rds.id
  sensitive = false
}