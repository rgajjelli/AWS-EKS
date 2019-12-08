# AWS-EKS Cluster AutoDiscover

1. ensure autoscaler version should match to "eks cluster", check Console and match against.

containers:
  - image: k8s.gcr.io/cluster-autoscaler:v1.14.7

2. ensure name of the cluster presents

example:

--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/
cluster-autoscaler/<CLUSTER_NAME>

--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/
cluster-autoscaler/eks-k8s-cluster

3. cluster-autoscaler.kubernetes.io/safe-to-evict="false" --overwrite

kubectl apply -f 3.cluster-autoscaler-autodiscover.yaml cluster-autoscaler.kubernetes.io/safe-to-evict="false" --overwrite

4. kubectl apply -f nginx-deployment.yaml
5. kubectl get pods -n kube-system
6. kubectl get nodes -l instance-type=spot

kubectl scale --replicas=3 deployment/test-autoscaler
kubectl get pods -n kube-system
kubectl scale --replicas=4 deployment/test-autoscaler

kubectl get nodes -l instance-type=spot > this will create a new EC2 worker node automatically
