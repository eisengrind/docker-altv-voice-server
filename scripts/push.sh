#!/bin/bash

IMAGE=$1
BRANCH=$2
BUILD=$3

docker build . --build-arg BRANCH=$BRANCH -t $IMAGE:$BUILD
docker tag $IMAGE:$BUILD $IMAGE:$BRANCH

docker push $IMAGE:$BUILD
docker push $IMAGE:$BRANCH

