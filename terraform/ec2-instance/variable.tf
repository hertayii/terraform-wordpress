variable "region" {
  description = "EC2-region"
  default     = "us-east-1"
}
# variable "availability_zones" {
#         description = "AZ for wordpress subnets"
#         default = "us-east-1a"
# }

variable "name" {
  type = string
}


variable "subnet_ids" {
  type = list(any)
}

variable "vpc_id" {
  type = string
}
variable "vpc_cidr1" {
  default = "10.0.0.0/16"
}

variable "http" {
  default = "80"
}

variable "https" {
  default = "443"
}
variable "ssh" {
  default = "22"
}

variable "ami" {
  default = "ami-08e4e35cccc6189f4"
}

variable "type" {
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "ssh-key"
}