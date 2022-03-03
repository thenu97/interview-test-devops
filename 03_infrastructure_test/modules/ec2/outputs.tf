output "public_ip" {
  value       = aws_instance.bink.public_ip
  description = "The public IP of the bink server"
}
output "bink-id" {
  description = "The instance id for bink server"
  value       = aws_instance.bink.id
}
