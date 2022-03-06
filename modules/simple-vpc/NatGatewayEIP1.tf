/*
  NatGatewayEIP1:
    DependsOn:
    - VPCGatewayAttachment
    Type: 'AWS::EC2::EIP'
    Properties:
      Domain: vpc
*/

resource "aws_eip" "simple-nat-gateway-EIP-1" {
  vpc = true

  # depends_on = [ aws_internet_gateway_attachment.simple-internet-gateway-attachment ]

}
