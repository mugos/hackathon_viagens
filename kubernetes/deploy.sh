#!/bin/bash

# Use deploy directory as working directory
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

# halt on any error
# set -e

dg() {
  docker run --rm -ti -w /current \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/.ssh:/.ssh \
    -v $(pwd):/current \
    --volumes-from gcloud-config yurifl/gcloud $@
}

/usr/bin/nvim ../VERSION

VERSION=$(cat ../VERSION)

docker-compose -f ../production.yml build

docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:$VERSION"
docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:latest"
dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:$VERSION"
dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:latest"

# docker tag hackathon-viagens-ngrok "gcr.io/yebo-project/hackathon-viagens-ngrok:$VERSION"
# docker tag hackathon-viagens-ngrok "gcr.io/yebo-project/hackathon-viagens-ngrok:latest"
# dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-ngrok:$VERSION"
# dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-ngrok:latest"

echo "dg kubectl rolling-update hackathon-viagens --image=\"gcr.io/yebo-project/hackathon-viagens:$VERSION\""
