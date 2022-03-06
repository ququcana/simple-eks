/*
  PrivateRoute01:
    DependsOn:
    - VPCGatewayAttachment
    - NatGateway01
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PrivateRouteTable01
      DestinationCidrBlock: 0.0.0.0/0
      NatGatewayId: !Ref NatGateway01
*/

resource "aws_route" "simple-vpc-route-private-a" {
  route_table_id            = aws_route_table.simple-vpc-route-table-private-a.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.simple-nat-gateway-1.id

  depends_on                = [ 
      aws_nat_gateway.simple-nat-gateway-1,
      # aws_internet_gateway_attachment.simple-internet-gateway-attachment,
    ]
}
