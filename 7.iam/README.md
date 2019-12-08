# AWS-EKS Pre checks

1. IAM console , create 2 IAM users
eks-admin1
eks-prod-viewer

eks-admin1 belongs to system:masters
eks-prod-viewer belongs to 'prod-viewer-role'


2.

kubectl edit cm -n kube-system -o yaml
** update as follows **

- userarn: arn:aws:iam::118143304519:user/eks-admin1
  username: eks-admin1
  groups:
    - system:masters
- userarn: arn:aws:iam::118143304519:user/eks-prod-viewer
  username: eks-prod-viewer
  groups:
    - prod-viewer-role


3. prod-viewer-role - Create Role, RoleBindings

kubectl apply -f aws-prod-view-role.yaml
kubectl apply -f aws-prod-view-role-binding.yaml
