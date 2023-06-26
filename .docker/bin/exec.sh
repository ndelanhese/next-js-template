#!/bin/bash

set -e

source ../.env

docker exec -it "next-app_$CURRENT_BUILD" sh
