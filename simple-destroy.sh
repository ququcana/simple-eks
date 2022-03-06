#!/bin/bash

source .profile

# kubeflow destroy
kfctl delete -V -f kfctl_aws.yaml

# cluster destroy
terraform destroy -var-file $TFVARS -auto-approve

## manually destroy
# (Role) kf-admin-us-east-1-eks-simple 
# (Identity providers) Identity provider
# (VPC) simple-vpc

echo -e "\ndestroy finished\n"

exit 0
