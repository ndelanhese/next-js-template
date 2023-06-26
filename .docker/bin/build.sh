#!/bin/bash

set -e

source ../.env

BUILD=$((BUILD + 1))

docker build ../.. -f ../Dockerfile -t "next-app_image_$BUILD"
docker create --name "next-app_$BUILD" -p 3000:3000 "next-app_image_$BUILD"

if [ "$CURRENT_BUILD" == "0" ]; then
  CURRENT_BUILD=$BUILD
fi

echo "BUILD=${BUILD}
CURRENT_BUILD=${CURRENT_BUILD}
PREVIOUS_BUILD=${PREVIOUS_BUILD}" > ../.env
