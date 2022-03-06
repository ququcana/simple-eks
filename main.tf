terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 3.0"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws-region
}

module "simple-vpc" {
  source = "./modules/simple-vpc"
  aws-availability-zones = var.aws-availability-zones
  cidr-vpc = var.cidr-vpc
  cidr-subnets = var.cidr-subnets
  cluster-name = var.cluster-name
}

module "simple-eks" {
  source = "./modules/simple-eks"
  private-subnet-ids = module.simple-vpc.private-subnet-ids
  public-subnet-ids  = module.simple-vpc.public-subnet-ids
  security-group-ids = module.simple-vpc.security-group-ids
  cluster-name = var.cluster-name
  instance-types = var.instance-types 
  k8s-version = var.k8s-version
}