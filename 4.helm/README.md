# Autoscaling an EKS Cluster

## Horizontal Pod Autoscaler (HPA)
### Install Helm

curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
chmod +x get_helm.sh
./get_helm.sh


### Configure Tiller RBAC
`kubectl apply -f tiller-rbac.yaml`
### Install Helm using Tiller Service Account
`helm init --service-account tiller`

### Example :: Install Metrics Server

helm install stable/metrics-server --name metrics-server --version 2.0.4 --namespace metrics`
kubectl get apiservice v1beta1.metrics.k8s.io -o yaml
### Deploy Apache/PHP

`kubectl run php-apache --image=k8s.gcr.io/hpa-example --requests=cpu=200m --expose --port=80`

### Autoscale the Deployment

`kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10`

### Check Status

`kubectl get hpa`
