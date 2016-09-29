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

docker-compose run --rm web npm run build --production

docker-compose -f ../production.yml build

docker tag hackathon-viagens-web "gcr.io/yebo-project/hackathon-viagens-web:$VERSION"
docker tag hackathon-viagens-web "gcr.io/yebo-project/hackathon-viagens-web:latest"

docker tag hackathon-viagens-api "gcr.io/yebo-project/hackathon-viagens-api:$VERSION"
docker tag hackathon-viagens-api "gcr.io/yebo-project/hackathon-viagens-api:latest"

dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-api:$VERSION"
dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-api:latest"

dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-web:$VERSION"
dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens-web:latest"

echo "docker run --rm -ti -p 80:80 -p 443:443 gcr.io/yebo-project/hackathon-viagens-web:v$VERSION"
echo "docker run --rm -ti -p 80:80 -p 443:443 gcr.io/yebo-project/hackathon-viagens-api:v$VERSION"

echo "dg kubectl rolling-update hackathon-viagens-api --image=\"gcr.io/yebo-project/hackathon-viagens-api:$VERSION\""
echo "dg kubectl rolling-update hackathon-viagens-web --image=\"gcr.io/yebo-project/hackathon-viagens-web:$VERSION\""
