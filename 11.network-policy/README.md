# AWS-EKS Ingress checks
https://docs.aws.amazon.com/eks/latest/userguide/calico.html

1. Install calico network engine on k8s
kubectl apply -f https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/release-1.5/config/v1.5/calico.yaml
kubectl get daemonset calico-node --namespace kube-system


2. create a sample pod
kubectl run bookstoreapi --image=nginx --labels app-bookstore,role=api --express --port 80

3. Run other pod as below, which will communicate with bookstoreapi pod

kubectl run test1 --rm -it --image=alpine -- sh
wget http://bookstoreapi

4. apply network policy
kubectl apply -f allow.yaml

5. Try this, will get error

kubectl run test1 --rm -it --image=alpine -- sh
wget http://bookstoreapi 
