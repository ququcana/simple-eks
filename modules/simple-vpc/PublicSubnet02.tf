/*
  PublicSubnet02:
    Type: AWS::EC2::Subnet
    Metadata:
      Comment: Subnet 02
    Properties:
      MapPublicIpOnLaunch: true
      AvailabilityZone:
        Fn::Select:
        - '1'
        - Fn::GetAZs:
            Ref: AWS::Region
      CidrBlock:
        Ref: PublicSubnet02Block
      VpcId:
        Ref: VPC
      Tags:
      - Key: Name
        Value: !Sub "${AWS::StackName}-PublicSubnet02"
      - Key: kubernetes.io/role/elb
        Value: 1
*/

resource "aws_subnet" "simple-vpc-subnet-public-b" {
  vpc_id     = aws_vpc.simple-vpc.id
  cidr_block = var.cidr-subnets[1]
  availability_zone = var.aws-availability-zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "simple-vpc-subnet-public-b"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}
