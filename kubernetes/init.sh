#!/bin/bash

# Use deploy directory as working directory
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

dg() {
  docker run --rm -w /current \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/.ssh:/.ssh \
    -v $(pwd):/current \
    --volumes-from gcloud-config yurifl/gcloud $@
}

docker-compose -f ../production.yml build

docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:latest"

dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:latest"

dg kubectl create -f ./web.yaml
# dg kubectl delete -f ./web.yaml

dg kubectl get svc

dg kubectl get rc
