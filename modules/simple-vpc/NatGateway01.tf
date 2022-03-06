/*
  NatGateway01:
    DependsOn:
    - NatGatewayEIP1
    - PublicSubnet01
    - VPCGatewayAttachment
    Type: AWS::EC2::NatGateway
    Properties:
      AllocationId: !GetAtt 'NatGatewayEIP1.AllocationId'
      SubnetId: !Ref PublicSubnet01
      Tags:
      - Key: Name
        Value: !Sub '${AWS::StackName}-NatGatewayAZ1'
*/

resource "aws_nat_gateway" "simple-nat-gateway-1" {
  allocation_id = aws_eip.simple-nat-gateway-EIP-1.allocation_id
  subnet_id     = aws_subnet.simple-vpc-subnet-public-a.id

  tags = {
    Name = "simple-nat-gateway-1"
  }

  depends_on = [
        aws_eip.simple-nat-gateway-EIP-1,
        aws_subnet.simple-vpc-subnet-public-a,
        # aws_internet_gateway_attachment.simple-internet-gateway-attachment,
      ]
}
