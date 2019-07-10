# k8workshop



## Initial Setup

### Set KubeConfig from eks cluster

`aws eks --region us-west-2 update-kubeconfig --name se-workshop`

### Clone Github
`git clone https://github.com/cwgdata/k8workshop`

## Test Config

`kubectl get nodes`

## Change to helm directory after cloning

`cd k8workshop/helm`

## Run Script to build your yaml

`chmod 777 build_yaml.sh`

## Substitute your first initial last name whever you see <REPLACE_THIS> below, ex: cgilmore

`./build_yaml.sh <REPLACE THIS>`

## Deploy Zookeeper

`helm install -f ./providers/<REPLACE THIS>.yaml --name zookeeper-<REPLACE_THIS>  --namespace <REPLACE_THIS> --set zookeeper.enabled=true ./confluent-operator`


