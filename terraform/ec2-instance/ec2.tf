resource "aws_instance" "wordpress" {
  ami           = var.ami
  instance_type = var.type
  # vpc_cidr = "${aws_vpc.wordpress.vpc_id}"
  # vpc_cidr = var.vpc_cidr1
  subnet_id = var.subnet_ids[1]
  # subnet_id = "${aws_subnet.public_subnet_cidr.pub_sub[1]}"
  security_groups = [aws_security_group.wordpress.id]
  key_name        = var.key_name
  tags = {
    Name = var.name
  }
}

