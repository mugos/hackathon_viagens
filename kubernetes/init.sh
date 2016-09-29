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

docker-compose run --rm web npm run build --production

docker-compose -f ../production.yml build

docker tag hackathon-viagens-web "gcr.io/yebo-project/hackathon-viagens-web:latest"
docker tag hackathon-viagens-api "gcr.io/yebo-project/hackathon-viagens-api:latest"

dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-api:latest"
dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-web:latest"

docker tag hackathon-viagens-ngrok "gcr.io/yebo-project/hackathon-viagens-ngrok:latest"
dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-ngrok:latest"

echo "docker run --rm -ti -p 80:80 -p 443:443 gcr.io/yebo-project/hackathon-viagens-web:latest"
echo "docker run --rm -ti -p 80:80 -p 443:443 gcr.io/yebo-project/hackathon-viagens-api:latest"

# dg kubectl create -f ./web.yaml
# dg kubectl create -f ./api.yaml
# dg kubectl create -f ./rethinkdb.yaml
# dg kubectl create -f ./ngrok.yaml

# dg kubectl delete -f ./web.yaml

dg kubectl get svc

dg kubectl get rc
