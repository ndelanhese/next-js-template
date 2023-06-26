#!/bin/bash

set -e

source ../.env

if [ "$CURRENT_BUILD" == "$BUILD" ]; then
  echo "The pointer is up to date."
else
  PREVIOUS_BUILD=$CURRENT_BUILD
  CURRENT_BUILD=$BUILD

  docker stop "next-app_$PREVIOUS_BUILD"
fi

docker start "next-app_$CURRENT_BUILD"

echo "BUILD=${BUILD}
CURRENT_BUILD=${CURRENT_BUILD}
PREVIOUS_BUILD=${PREVIOUS_BUILD}" > ../.env
