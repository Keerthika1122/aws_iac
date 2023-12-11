resource "aws_internet_gateway" "myIgw"{
    vpc_id = aws_vpc.MyVPC.id
}