resource "aws_eip" "eip" {
  instance = aws_instance.public_instance.id
  domain = "vpc"
}