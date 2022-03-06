/*
  PrivateRouteTable01:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
      - Key: Name
        Value: Private Subnet AZ1
      - Key: Network
        Value: Private01
*/

resource "aws_route_table" "simple-vpc-route-table-private-a" {
  vpc_id = aws_vpc.simple-vpc.id

  tags = {
    Name = "simple-vpc-route-table-private-a"
    Network = "Private01"
  }
}
