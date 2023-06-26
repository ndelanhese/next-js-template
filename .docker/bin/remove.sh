#!/bin/bash

set -e

BUILD_ID="$1"

source ../.env

if [ -z "$BUILD_ID" ]; then
  echo "No BUILD_ID provided. Please specify a valid BUILD_ID."
  echo "Specify a the command such as 'make remove BUILD_ID=1'."
elif [ "$CURRENT_BUILD" == "$BUILD_ID" ]; then
  echo "Current build cannot be deleted."
else
  docker rm "next-app_$BUILD_ID"
fi
