/*
  PublicRoute:
    DependsOn: VPCGatewayAttachment
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PublicRouteTable
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Ref InternetGateway

*/

resource "aws_route" "simple-vpc-route-PublicRoute" {
  route_table_id            = aws_route_table.simple-vpc-route-table-public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.simple-internet-gateway.id

  # depends_on                = [ aws_internet_gateway_attachment.simple-internet-gateway-attachment ]
}
