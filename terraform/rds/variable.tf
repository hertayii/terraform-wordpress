variable "region" {
  description = "EC2-region"
  default     = "us-east-1"
}
variable "type" {
  type    = string
  default = "db.t2.micro"
}
variable "rds_sg" {
  type    = string
  default = "rds-sg"
}
variable "db_name" {
  type    = string
  default = "wordpress"
}
variable "db_user" {
  description = "Database administrator username"
  default     = "admin"
  type        = string
  sensitive   = true
}
variable "db_pass" {
  description = "Database administrator password"
  default     = "adminadmin"
  type        = string
  sensitive   = true
}
variable "vpc_id" {
  type = string
}

variable "wordp_sg" {
  type = list(any)
}
# variable "private_sub"{
#     type = string
# }

variable "private_sub" {
  # type = string
}