resource "aws_instance" "public_instance" {
  ami           = "ami-05a5f6298acdb05b6"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.key_name
  security_groups = [aws_security_group.Security_Group.id]
  subnet_id     = aws_subnet.PublicSubnet.id
  tags = {
    Name = "public_instance"
  }
}