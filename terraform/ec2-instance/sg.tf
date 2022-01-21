resource "aws_security_group" "wordpress" {
  name          = "${var.name}-sg"
  description   = "Default security group to allow inbound/outbound from the VPC"
  #   vpc_id      = "${aws_vpc.wordpress.id}"
  vpc_id        = var.vpc_id
  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.ssh
    to_port     = var.ssh
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.name}-sg"
  }
}
output "sg-wordpress" {
  value     = aws_security_group.wordpress.id
  sensitive = false
}