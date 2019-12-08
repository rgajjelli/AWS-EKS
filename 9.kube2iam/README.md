# AWS-EKS Pre checks


IAM Permissions
---------------

1. Inline Policy for the EC2 worker node's IAM role to add permission to Assume other IAM role

{
    "Version": "2012-10-17",
    "Statement": [
      {
      "Effect": "Allow",
      "Resource": "arn:aws:iam::<ACCOUNT_ID>:role/k8s*",
      "Action": "sts:AssumeRole"
      }
    ]
}

2. If POD wants to communicate, add the below ROLE.

    2.1 Create a Role - k8s-s3-list-bucket-role  (AmazonS3FullAceess - only keep the required one )
    2.2 Edit the Trust relationship and add the below endure NodeInstance_RoleARN

    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "<NodeInstance_RoleARN>"
      },
      "Action": "sts:AssumeRole"
    }

3. aws-cli.yaml  update the file with annotation of the above ROLE


apiVersion: v1
kind: Pod
metadata:
  name: aws-cli
  labels:
    name: aws-cli
  annotations:
    iam.amazonaws.com/role: <ROLE>
spec:
  containers:
    - image: cgswong/aws:aws
      command:
        - "sleep"
        - "9999"
      name: aws-cli

4.
      kubectl apply -f kube2iam.yaml
      kubectl get daemonset --all-namespaces
      kubectl apply -f aws-cli.yaml
      kubectl exec -it aws-cli aws s3 ls
      kubectl exec -it aws-cli  -- sh

      curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
      kubectl delete pod aws-cli --force --grace-period=0
      kubectl get pods

5.

vim aws-cli.yaml

kubectl apply -f aws-cli.yaml
kubectl exec -it aws-cli aws s3 ls
vim aws-cli.yaml
kubectl exec -it aws-cli aws s3 ls
kubectl exec -it aws-cli  -- sh
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
vim aws-cli.yaml
kubectl delete pod aws-cli --force --grace-period=0
kubectl apply -f aws-cli.yaml
kubectl exec -it aws-cli aws s3 ls
kubectl exec -it aws-cli  -- sh
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/
