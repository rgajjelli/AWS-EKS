# AWS-EKS Cluster AutoDiscover

1. ensure eks-publickey exists.

2. eks cluster delete node group

eksctl delete nodegroup --config-file=eks-course.yaml --include=ng-mixed --approve
eksctl delete nodegroup --config-file=eks-autoscaler-1.yaml --include="scale-east1a" --approve
