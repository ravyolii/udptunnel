#!/bin/bash
ENV_PREFIX=$1
TAG=0.4
docker buildx build --platform linux/amd64 \
  --push --pull \
  -t gcr.io/$ENV_PREFIX/udptunnel:latest \
  -t gcr.io/$ENV_PREFIX/udptunnel:$TAG \
  . 