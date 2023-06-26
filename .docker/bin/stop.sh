#!/bin/bash

set -e

source ../.env

docker stop "next-app_$CURRENT_BUILD"
