/*
  VPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock:  !Ref VpcBlock
      EnableDnsSupport: true
      EnableDnsHostnames: true
      Tags:
      - Key: Name
        Value: !Sub '${AWS::StackName}-VPC'
*/

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "simple-vpc" {
  cidr_block = var.cidr-vpc
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "simple-vpc"
  }
}
