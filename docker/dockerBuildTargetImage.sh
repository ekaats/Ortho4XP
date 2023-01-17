#!/usr/bin/bash
set -euxo pipefail
echo "================================================================================================================="
echo "Building the target (docker)image that will contain a runnable O4XP version with all required dependencies."
echo "The target (docker)image build copies the virtual python environment (from the compile (docker)image) to the "
echo "target container. It also copies the O4XP python code (the complete repo) into the target container."
echo "A multistage build is not used to be able to build the containers separately."
echo "================================================================================================================="
cd ..
docker build --no-cache --tag o4xp --file ./docker/DockerfileTarget .
