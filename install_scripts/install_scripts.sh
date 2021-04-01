#! /bin/bash

#Intall terraform
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y unzip wget
wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin
rm terraform_*_linux_*.zip


#Install ansible
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

#install awscli
sudo apt install awscli

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"| tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
