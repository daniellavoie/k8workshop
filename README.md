# Confluent k8s Workshop for SE Team



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
NOTE: build_yaml will update your readme in k8workshop directory if you want to copy paste from there after this command

```plain
export INITIALS=REPLACE_THIS
./build_yaml.sh $REPLACE_THIS
```

## Deploy Zookeeper

`helm install -f ./providers/$INITIALS.yaml --name zookeeper-$INITIALS  --namespace $INITIALS --set zookeeper.enabled=true ./confluent-operator`

## Check deployment
`kubectl -n $INITIALS get pods -o wide`

## Deploy Kafka

`helm install -f ./providers/$INITIALS.yaml --name kafka-$INITIALS  --namespace $INITIALS --set kafka.enabled=true ./confluent-operator`

## Look at Services
`kubectl -n $INITIALS get services -o wide`

## Deploy Connect

`helm install -f ./providers/$INITIALS.yaml --name connect-$INITIALS  --namespace $INITIALS --set connect.enabled=true ./confluent-operator`

## Deploy Schema Registry

`helm install -f ./providers/$INITIALS.yaml --name schemaregistry-$INITIALS  --namespace $INITIALS --set schemaregistry.enabled=true ./confluent-operator`

## Deploy KSQL

`helm install -f ./providers/$INITIALS.yaml --name ksql-$INITIALS  --namespace $INITIALS --set ksql.enabled=true ./confluent-operator`

## Deploy C3

`helm install -f ./providers/$INITIALS.yaml --name controlcenter-$INITIALS  --namespace $INITIALS --set controlcenter.enabled=true ./confluent-operator`

## Scale Kafka

`kubectl edit kafka kafka-$INITIALS -n $INITIALS`

Change the replicas value to 4 and save!

## Look at new node!

`kubectl -n $INITIALS get pods -o wide | grep kafka`

## Clean up!

```
helm delete --purge controlcenter-$INITIALS
helm delete --purge ksql-$INITIALS
helm delete --purge schemaregistry-$INITIALS
helm delete --purge connect-$INITIALS
helm delete --purge kafka-$INITIALS
helm delete --purge zookeeper-$INITIALS
```







