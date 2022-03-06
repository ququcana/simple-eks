output "simple-eks-endpoint" {
  value = aws_eks_cluster.simple-eks-cluster.endpoint
}

output "simple-eks-kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.simple-eks-cluster.certificate_authority[0].data
}