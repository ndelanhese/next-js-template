#!/bin/bash

set -e

source ../.env

docker start "next-app_$CURRENT_BUILD"
