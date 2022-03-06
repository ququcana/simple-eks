/*
  PrivateSubnet01RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PrivateSubnet01
      RouteTableId: !Ref PrivateRouteTable01
*/

resource "aws_route_table_association" "simple-route-table-assosiation-private-a" {
  subnet_id      = aws_subnet.simple-vpc-subnet-private-a.id
  route_table_id = aws_route_table.simple-vpc-route-table-private-a.id
}