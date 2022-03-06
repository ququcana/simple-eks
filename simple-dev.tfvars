# Kubernetes master version
k8s-version = "1.18"

# EKS cluster name (string), like eks-simple
cluster-name="eks-simple"

# AWS region (string), like us-east-1
aws-region="us-east-1"

# AWS availability zones (list(string)), like us-east-1a, us-east-1b
aws-availability-zones=[
    "us-east-1a",
    "us-east-1b",
]

## CIDR blocks ..
# .. for VPC (string)
cidr-vpc="192.168.0.0/16"

#  .. for subnets (list(string))
cidr-subnets=[
    "192.168.0.0/18",
    "192.168.64.0/18",
    "192.168.128.0/18",
    "192.168.192.0/18",
]

# EC2 instance types
instance-types = [
    "m5.large",
]