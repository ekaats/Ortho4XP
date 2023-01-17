#!/usr/bin/bash
set -euxo pipefail
echo "================================================================================================================="
echo "Building the compile (docker)image that is used to create (and contain) all python packages required by O4XP."
echo "The target (docker)image build then copies the virtual python environment to the target container."
echo "A multistage build is not used to be able to build the containers separately."
echo "================================================================================================================="
cd ..
docker build --no-cache --tag o4xp-compile-image --file ./docker/DockerfileCompile .
