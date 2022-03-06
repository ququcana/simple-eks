/*
  PrivateSubnet01:
    Type: AWS::EC2::Subnet
    Metadata:
      Comment: Subnet 03
    Properties:
      AvailabilityZone:
        Fn::Select:
        - '0'
        - Fn::GetAZs:
            Ref: AWS::Region
      CidrBlock:
        Ref: PrivateSubnet01Block
      VpcId:
        Ref: VPC
      Tags:
      - Key: Name
        Value: !Sub "${AWS::StackName}-PrivateSubnet01"
      - Key: kubernetes.io/role/internal-elb
        Value: 1
*/

resource "aws_subnet" "simple-vpc-subnet-private-a" {
  vpc_id     = aws_vpc.simple-vpc.id
  cidr_block = var.cidr-subnets[2]
  availability_zone = var.aws-availability-zones[0]

  tags = {
    Name = "simple-vpc-subnet-private-a"
    "kubernetes.io/role/internal-elb" = "1"
  }
}
