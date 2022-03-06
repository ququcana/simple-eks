/*
  InternetGateway:
    Type: "AWS::EC2::InternetGateway"
*/
resource "aws_internet_gateway" "simple-internet-gateway" {
  vpc_id     = aws_vpc.simple-vpc.id

  tags = {
    Name = "simple-internet-gateway"
  }
}
