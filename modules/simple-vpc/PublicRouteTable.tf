/*
  PublicRouteTable:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
      - Key: Name
        Value: Public Subnets
      - Key: Network
        Value: Public
*/
resource "aws_route_table" "simple-vpc-route-table-public" {
  vpc_id = aws_vpc.simple-vpc.id

  tags = {
    Name = "simple-vpc-route-table-public"
    Network = "Public"
  }
}
