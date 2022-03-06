/*
  NatGateway02:
    DependsOn:
    - NatGatewayEIP2
    - PublicSubnet02
    - VPCGatewayAttachment
    Type: AWS::EC2::NatGateway
    Properties:
      AllocationId: !GetAtt 'NatGatewayEIP2.AllocationId'
      SubnetId: !Ref PublicSubnet02
      Tags:
      - Key: Name
        Value: !Sub '${AWS::StackName}-NatGatewayAZ2'
*/

resource "aws_nat_gateway" "simple-nat-gateway-2" {
  allocation_id = aws_eip.simple-nat-gateway-EIP-2.allocation_id
  subnet_id     = aws_subnet.simple-vpc-subnet-public-b.id

  tags = {
    Name = "simple-nat-gateway-2"
  }

  depends_on = [
        aws_eip.simple-nat-gateway-EIP-2,
        aws_subnet.simple-vpc-subnet-public-b,
        # aws_internet_gateway_attachment.simple-internet-gateway-attachment,
      ]
}