locals {
  all-subnet-ids = setunion(var.private-subnet-ids, var.public-subnet-ids)
}

resource "aws_eks_cluster" "simple-eks-cluster" {
  name     = var.cluster-name
  version  = var.k8s-version
  role_arn = aws_iam_role.simple-iam-eks-cluster-role.arn

  vpc_config {
    # subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
    subnet_ids         = local.all-subnet-ids
    security_group_ids = var.security-group-ids
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.simple-iam-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.simple-iam-AmazonEKSVPCResourceController,
  ]
}