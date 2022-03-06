variable "cluster-name" {
  description = "# EKS cluster name (string), like eks-simple"
}

variable "k8s-version" {
  description = "# Kubernetes master version"
}

variable "aws-region" {
  description = "# AWS region (string), like us-east-1"
}

variable "aws-availability-zones" {
  description = "# AWS availability zones (list(string)), like us-east-1a, us-east-1b"
}

variable "cidr-vpc" {
  description = "# CIDR block for VPC (string)"
}

variable "cidr-subnets" {
  description = "# CIDR blocks for subnets (list(string))"
}

variable "instance-types" {
  description = "# EC2 instance types (list(strings))"
}

