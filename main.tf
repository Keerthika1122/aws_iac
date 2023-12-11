terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.24.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIA3NFY6FDFNENT7JC3"
    secret_key = "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"
}

resource "tls_private_key" "rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
variable "key_name" {}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa-4096.public_key_openssh
}
resource "local_file" "Keerthi" {
  content  = tls_private_key.rsa-4096.private_key_pem
  filename = "c:\\users\\suppo\\desktop\\Keerthi.pem" 
}
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