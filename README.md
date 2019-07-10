# k8workshop



## Initial Setup

### Clone Github
`git clone https://github.com/cwgdata/k8workshop`

### Set KubeConfig from eks cluster

`aws eks --region us-west-2 update-kubeconfig --name se-workshop`

## Test Config

`kubectl get nodes`

## Change to helm directory after cloning

`cd k8workshop/helm`

## Run Script to build your yaml

`chmod 777 build_yaml.sh`

## Substitute your first initial last name whever you see REPLACE THIS below, ex: cgilmore
## build_yaml will update your readme in k8workshop directory if you want to copy paste from there after this command

`./build_yaml.sh REPLACE_THIS`

## Deploy Zookeeper

`helm install -f ./providers/REPLACE_THIS.yaml --name zookeeper-REPLACE_THIS  --namespace REPLACE_THIS --set zookeeper.enabled=true ./confluent-operator`

## Check deployment
`kubectl -n REPLACE_THIS get pods -o wide`

## Deploy Kafka

`helm install -f ./providers/REPLACE_THIS.yaml --name kafka-REPLACE_THIS  --namespace REPLACE_THIS --set kafka.enabled=true ./confluent-operator`

## Look at Services
`kubectl -n REPLACE_THIS get services -o wide`


