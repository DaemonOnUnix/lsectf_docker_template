#!/bin/sh

set -e

cd ./src
make

cd ..

sudo docker build -t "$1" --no-cache .


