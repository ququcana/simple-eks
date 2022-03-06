/*
  PrivateSubnet02RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PrivateSubnet02
      RouteTableId: !Ref PrivateRouteTable02
*/

resource "aws_route_table_association" "simple-route-table-assosiation-private-b" {
  subnet_id      = aws_subnet.simple-vpc-subnet-private-b.id
  route_table_id = aws_route_table.simple-vpc-route-table-private-b.id
}