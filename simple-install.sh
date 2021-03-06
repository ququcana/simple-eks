#!/bin/bash

# already done:
# cd ~/kubeflow-wsl/${AWS_CLUSTER_NAME}
# source .profile

terraform apply -var-file ${TFVARS} | tee -a ~/kubeflow-wsl/tmp/terraform.tmp

aws eks update-kubeconfig --region ${AWS_REGION} --name ${AWS_CLUSTER_NAME} | tee -a ~/kubeflow-wsl/tmp/aws.logs

cat << EOF > kfctl_aws.yaml
apiVersion: kfdef.apps.kubeflow.org/v1
kind: KfDef
metadata:
  namespace: kubeflow
spec:
  applications:
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: namespaces/base
    name: namespaces
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: application/v3
    name: application
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/istio-1-3-1-stack
    name: istio-stack
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/cluster-local-gateway-1-3-1
    name: cluster-local-gateway
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: istio/istio/base
    name: istio
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/cert-manager-crds
    name: cert-manager-crds
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/cert-manager-kube-system-resources
    name: cert-manager-kube-system-resources
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/cert-manager
    name: cert-manager
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: metacontroller/base
    name: metacontroller
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/oidc-authservice
    name: oidc-authservice
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/dex-auth
    name: dex
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: admission-webhook/bootstrap/overlays/application
    name: bootstrap
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: spark/spark-operator/overlays/application
    name: spark-operator
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws
    name: kubeflow-apps
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: aws/istio-ingress/base_v3
    name: istio-ingress
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: knative/installs/generic
    name: knative
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: kfserving/installs/generic
    name: kfserving
  - kustomizeConfig:
      repoRef:
        name: manifests
        path: stacks/aws/application/spartakus
    name: spartakus
  plugins:
  - kind: KfAwsPlugin
    metadata:
      name: aws
    spec:
      auth:
        basicAuth:
          password: 12341234
          username: admin@kubeflow.org
      region: ${AWS_REGION}
      enablePodIamPolicy: true
      # If you don't use IAM Role for Service Account, you can still use node instance roles.
      #roles:
      #- eksctl-kubeflow-aws-nodegroup-ng-a2-NodeInstanceRole-xxxxxxx
  repos:
  - name: manifests
    uri: https://github.com/kubeflow/manifests/archive/v1.2.0.tar.gz
  version: v1.2-branch
EOF

# kubeflow installation
# wget -O kfctl_aws.yaml $CONFIG_URI
kfctl apply -V -f kfctl_aws.yaml

# metrics
# kubectl apply -f ~/kubeflow-wsl/kubernetes-sigs-metrics-server-d1f4f6f/deploy/1.8+

aws iam attach-role-policy \
  --policy-arn arn:aws:iam::244533366892:policy/AWSLoadBalancerControllerIAMPolicy \
  --role-name kf-admin-${AWS_REGION}-${AWS_CLUSTER_NAME} \
  | tee -a ~/kubeflow-wsl/tmp/aws.logs

aws eks describe-cluster --name eks-simple --query "cluster.identity.oidc.issuer" --output text | tee -a ~/kubeflow-wsl/tmp/aws.logs

echo -e "\nfinish\n"

exit 0
