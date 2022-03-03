resource "aws_instance" "bink" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.bink_sg
  subnet_id              = var.bink_subnet
  key_name               = var.bink_key
}
