/*
  PublicSubnet01RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PublicSubnet01
      RouteTableId: !Ref PublicRouteTable
*/

resource "aws_route_table_association" "simple-route-table-assosiation-public-a" {
  subnet_id      = aws_subnet.simple-vpc-subnet-public-a.id
  route_table_id = aws_route_table.simple-vpc-route-table-public.id
}