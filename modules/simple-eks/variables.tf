variable "k8s-version" {
  description = "# Kubernetes master version"
}

variable "cluster-name" {
  description = "# EKS cluster name (string), like eks-simple"
}

variable "public-subnet-ids" {
  description = "# VPC (public) subnet ids"
}

variable "private-subnet-ids" {
  description = "# VPC (private) subnet ids"
}

variable "instance-types" {
  description = "# EC2 instance types (list(strings))"
}

variable "security-group-ids" {
  description = "# VPC security group ids (list(strings))"
}
