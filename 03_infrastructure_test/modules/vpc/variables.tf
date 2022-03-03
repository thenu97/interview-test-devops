variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
}

variable "pub_cidr_block" {
  description = "CIDR block for public subnet"
  default     = "12.0.1.0/24"
}
