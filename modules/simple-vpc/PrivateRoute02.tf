/*
  PrivateRoute02:
    DependsOn:
    - VPCGatewayAttachment
    - NatGateway02
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PrivateRouteTable02
      DestinationCidrBlock: 0.0.0.0/0
      NatGatewayId: !Ref NatGateway02
*/

resource "aws_route" "simple-vpc-route-private-b" {
  route_table_id            = aws_route_table.simple-vpc-route-table-private-b.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.simple-nat-gateway-2.id  

  depends_on                = [ 
      aws_nat_gateway.simple-nat-gateway-2,
      # aws_internet_gateway_attachment.simple-internet-gateway-attachment,
    ]
}