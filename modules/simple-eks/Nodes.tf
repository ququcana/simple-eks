resource "aws_eks_node_group" "simple-eks-nodes" {
  cluster_name    = aws_eks_cluster.simple-eks-cluster.name
  node_group_name = "simple-eks-nodes-group"
  node_role_arn   = aws_iam_role.simple-iam-eks-node-role.arn
  subnet_ids      = var.private-subnet-ids
  instance_types  = var.instance-types

  scaling_config {
    desired_size = 4
    max_size     = 5
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.simple-iam-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.simple-iam-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.simple-iam-AmazonEKS_CNI_Policy,
  ]
}