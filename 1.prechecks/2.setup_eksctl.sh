#!/bin/sh

# Setup of eksctl
echo "Install eksctl utility.."
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

echo "The eksctl utility will use the same _credentials_ file as we explored for the AWS cli, located under '~/.aws/credentials file'"
echo "check the eksctl version"

eksctl version
