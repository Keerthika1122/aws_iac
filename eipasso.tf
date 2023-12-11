resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.public_instance.id
  allocation_id = aws_eip.eip.id
}