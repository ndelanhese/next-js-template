#!/bin/bash

set -e

source ../.env

if [ "$CURRENT_BUILD" == "$BUILD" ]; then
  echo "The next build does not exist."
else
  PREVIOUS_BUILD=$CURRENT_BUILD
  CURRENT_BUILD=$((CURRENT_BUILD + 1))

  docker stop "next-app_$PREVIOUS_BUILD"
fi

docker start "next-app_$CURRENT_BUILD"

echo "BUILD=${BUILD}
CURRENT_BUILD=${CURRENT_BUILD}
PREVIOUS_BUILD=${PREVIOUS_BUILD}" > ../.env
