#!/bin/bash

cd Jenkins-k8s 

eksctl create cluster --name DemoCluster --region eu-west-2 --nodegroup-name DemoNodes --nodes 2 --nodes-min 2 --nodes-max 3 --node-type t3.medium --with-oidc --ssh-access --ssh-public-key terraformKey --managed

kubctl apply -f mysql.yaml

 
