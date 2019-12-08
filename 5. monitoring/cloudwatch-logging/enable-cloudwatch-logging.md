# Cloudwatch logging of an EKS cluster

## enable e.g. via yaml config file

eksctl utils update-cluster-logging --config-file eks-course.yaml --approve

## disable via plain commandline call

eksctl utils update-cluster-logging --name=eks-k8s-cluster --disable-types all
