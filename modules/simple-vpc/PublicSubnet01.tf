/*
  PublicSubnet01:
    Type: AWS::EC2::Subnet
    Metadata:
      Comment: Subnet 01
    Properties:
      MapPublicIpOnLaunch: true
      AvailabilityZone:
        Fn::Select:
        - '0'
        - Fn::GetAZs:
            Ref: AWS::Region
      CidrBlock:
        Ref: PublicSubnet01Block
      VpcId:
        Ref: VPC
      Tags:
      - Key: Name
        Value: !Sub "${AWS::StackName}-PublicSubnet01"
      - Key: kubernetes.io/role/elb
        Value: 1
*/

resource "aws_subnet" "simple-vpc-subnet-public-a" {
  vpc_id     = aws_vpc.simple-vpc.id
  cidr_block = var.cidr-subnets[0]
  availability_zone = var.aws-availability-zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "simple-vpc-subnet-public-a"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}

