/*
  ControlPlaneSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Cluster communication with worker nodes
      VpcId: !Ref VPC
*/

resource "aws_security_group" "simple-vpc-control-panel-security-group" {
  name        = "simple-vpc-control-panel-security-group"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.simple-vpc.id
}