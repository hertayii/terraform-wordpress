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

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "CIDR for public subnet"
  default     = []
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "CIDR for private subnet"
  default     = []
}

variable "http" {
  type    = number
  default = "80"
}

variable "https" {
  type    = number
  default = "443"
}
variable "ssh" {
  type    = number
  default = "22"
}

variable "ami" {
  type    = string
  default = "ami-08e4e35cccc6189f4"
}

variable "type" {
  type    = string
  default = "t2.micro"
}

