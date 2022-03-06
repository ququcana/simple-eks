/*
  SubnetIds:
    Description: Subnets IDs in the VPC
    Value: !Join [ ",", [ !Ref PublicSubnet01, !Ref PublicSubnet02, !Ref PrivateSubnet01, !Ref PrivateSubnet02 ] ]

  SecurityGroups:
    Description: Security group for the cluster control plane communication with worker nodes
    Value: !Join [ ",", [ !Ref ControlPlaneSecurityGroup ] ]

  VpcId:
    Description: The VPC Id
    Value: !Ref VPC
*/

output private-subnet-ids {
  value       = [
    aws_subnet.simple-vpc-subnet-private-a.id,
    aws_subnet.simple-vpc-subnet-private-b.id,
  ]
  sensitive   = false
  description = "Subnets (private) IDs in the VCP"
}

output public-subnet-ids {
  value       = [
    aws_subnet.simple-vpc-subnet-public-a.id,
    aws_subnet.simple-vpc-subnet-public-b.id,
  ]
  sensitive   = false
  description = "Subnets (public) IDs in the VCP"
}

output security-group-id {
  value       = aws_security_group.simple-vpc-control-panel-security-group.id
  sensitive   = false
  description = "Security group for the cluster control plane communication with worker nodes"
}

output vpc-id {
  value       = aws_vpc.simple-vpc.id
  sensitive   = false
  description = "The VPC Id"
}

output security-group-ids {
  value       = [
    aws_security_group.simple-vpc-control-panel-security-group.id,
  ]
  sensitive   = false
  description = "VPC security group ids (list(strings))"
}