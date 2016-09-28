#!/bin/bash

# Use deploy directory as working directory
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

VERSION=$(cat ../VERSION)

# halt on any error
# set -e

dg() {
  docker run --rm -ti -w /current \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/.ssh:/.ssh \
    -v $(pwd):/current \
    --volumes-from gcloud-config yurifl/gcloud $@
}

recreate() {
  dg gcloud compute disks delete hackathon-data
  dg gcloud compute disks create --size=100GB --zone=us-east1-d hackathon-data
  # local function that list gcloud disks
  list_disks
}

list_disks() {
  dg gcloud compute disks list
}

create() {
  echo "Ta criado, não força"
  dg kubectl create -f ./web.yaml
  dg kubectl create -f ./rethinkdb.yaml
}

delete() {
  echo "Deleta não campeão, vai perder o ip PORRA"
  dg kubectl delete -f ./web.yaml
  dg kubectl delete -f ./rethinkdb.yaml
}

update() {
  echo "dg kubectl rolling-update hackathon-viagens --image=\"gcr.io/yebo-project/hackathon-viagens:$VERSION\""
}

list() {
  echo "get svc"
  dg kubectl get svc
  echo "get rc"
  dg kubectl get rc
  echo "get pods"
  dg kubectl get po
  echo "describe po"
  dg kubectl describe po hackathon-viagens
}

push(){
  docker-compose -f ../production.yml build
  docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:$VERSION"
  docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:latest"
  dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:$VERSION"
  dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:latest"
}

deploy() {
  vim ../VERSION
  docker-compose -f ../production.yml build
  docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:$VERSION"
  docker tag hackathon-viagens "gcr.io/yebo-project/hackathon-viagens:latest"
  dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:$VERSION"
  dg gcloud docker push "gcr.io/yebo-project/hackathon-viagens:latest"
  echo "dg kubectl rolling-update hackathon-viagens --image=\"gcr.io/yebo-project/hackathon-viagens:$VERSION\""
}

continue() {
  read -p "Press [Enter] key to continue..." key
}

while :
do
  clear
  echo "---------------------------------"
  echo "       M A I N - M E N U"
  echo "---------------------------------"
  echo '1. deploy'
  echo '2. delete'
  echo '3. create'
  echo '4. list'
  echo '5. update'
  echo '6. recreate disks'
  echo '7. list  disks'
  echo '8. push'
  echo '0. exit'
  echo "---------------------------------"
  read -r -p "Enter your choice: " option
  case ${option} in
    1) deploy
      continue;;
    2) delete
      continue;;
    3) create
      continue;;
    4) list
      continue;;
    5) update
      continue;;
    6) recreate
      continue;;
    7) list_disks
      continue;;
    8) push
      continue;;
    0) break;;
  esac
done
