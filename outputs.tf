output private-subnet-ids {
  value       = module.simple-vpc.private-subnet-ids
  sensitive   = false
  description = "Subnets (private) IDs in the VPC"
}

output public-subnet-ids {
  value       = module.simple-vpc.public-subnet-ids
  sensitive   = false
  description = "Subnets (public) IDs in the VPC"
}

output security-group-id {
  value       = module.simple-vpc.security-group-id
  sensitive   = false
  description = "Security group for the cluster control plane communication with worker nodes"
}

output vpc-id {
  value       = module.simple-vpc.vpc-id
  sensitive   = false
  description = "The VPC Id"
}