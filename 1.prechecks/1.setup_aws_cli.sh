#!/bin/sh

# Prerequisites

echo "check Python3 or Python2.7.9+ installed..? "
echo "check Python Pip3 / Pip available ..?"

echo "Install awscli.."

pip3 install --user awscli

echo "aws configure and set the aws_access_key_id  and aws_secret_access_key"

echo  "If AWS CLI already installed, upgrade the AWS CLI"
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
aws --version
