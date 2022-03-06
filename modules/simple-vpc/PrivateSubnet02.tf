/*
  PrivateSubnet02:
    Type: AWS::EC2::Subnet
    Metadata:
      Comment: Private Subnet 02
    Properties:
      AvailabilityZone:
        Fn::Select:
        - '1'
        - Fn::GetAZs:
            Ref: AWS::Region
      CidrBlock:
        Ref: PrivateSubnet02Block
      VpcId:
        Ref: VPC
      Tags:
      - Key: Name
        Value: !Sub "${AWS::StackName}-PrivateSubnet02"
      - Key: kubernetes.io/role/internal-elb
        Value: 1
*/

resource "aws_subnet" "simple-vpc-subnet-private-b" {
  vpc_id     = aws_vpc.simple-vpc.id
  cidr_block = var.cidr-subnets[3]
  availability_zone = var.aws-availability-zones[1]

  tags = {
    Name = "simple-vpc-subnet-private-b"
    "kubernetes.io/role/internal-elb" = "1"
  }
}