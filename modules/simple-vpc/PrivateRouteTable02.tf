/*
  PrivateRouteTable02:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
      - Key: Name
        Value: Private Subnet AZ2
      - Key: Network
        Value: Private02
*/

resource "aws_route_table" "simple-vpc-route-table-private-b" {
  vpc_id = aws_vpc.simple-vpc.id

  tags = {
    Name = "simple-vpc-route-table-private-b"
    Network = "Private02"
  }
}
