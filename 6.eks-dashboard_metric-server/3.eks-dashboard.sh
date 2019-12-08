#!/bin/sh

#export DASHBOARD_RELEASE=v2.0.0-beta1
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/$DASHBOARD_RELEASE/aio/deploy/recommended.yaml
#kubectl apply -f 3.admin-service-account.yaml


token=$(kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-course-admin | awk '{print $1}'))
echo "$token"
