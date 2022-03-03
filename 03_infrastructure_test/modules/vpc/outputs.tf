output "vpc_id" {
  value = aws_vpc.bink_vpc.id
}

output "aws_bink_sg_id" {
  value = aws_subnet.bink_pub.id
}
