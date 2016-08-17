#!/bin/bash

SUDO=$1; shift

DOCKER_USERNAME=${DOCkER_USERNAME:-emjburns}
DOCKER_PASS=${DOCKER_PASS:-null}
BUILD_NUMBER=${BUILD_NUMBER:-`date "+%Y%m%d-%H%M%S"`}

$SUDO docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASS"
$SUDO docker build -t emjburns/spin-kub-demo:v$BUILD_NUMBER .
$SUDO docker push emjburns/spin-kub-demo:v$BUILD_NUMBER

