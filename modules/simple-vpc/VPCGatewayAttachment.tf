/*
  VPCGatewayAttachment:
    Type: "AWS::EC2::VPCGatewayAttachment"
    Properties:
      InternetGatewayId: !Ref InternetGateway
      VpcId: !Ref VPC
*/

# actually was attached to created VPC automatically (?)

# resource "aws_internet_gateway_attachment" "simple-internet-gateway-attachment" {
  # internet_gateway_id = aws_internet_gateway.simple-internet-gateway.id
  # vpc_id              = aws_vpc.simple-vpc.id
# }
