resource "aws_vpc" "MyVPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "MyVPC"
    }
}
resource "aws_subnet" "PublicSubnet"{
    vpc_id = aws_vpc.MyVPC.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.1.0/24"
}
resource "aws_subnet" "PrivSubnet"{
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
}