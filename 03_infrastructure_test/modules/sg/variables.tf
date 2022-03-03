variable "open_internet" {
  description = "CIDR block open to the internet"
  default     = ["0.0.0.0/0"]
}

variable "outbound_port" {
  description = "Port open to allow outbound connection"
  default     = "0"
}

variable "vpc_id" {
  description = "VPC id"
}

variable "name" {
  description = "SG name"
  type        = string
  default     = "bink_sg"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22]
}
