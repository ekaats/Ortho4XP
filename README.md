# Ortho4XP
A scenery generator for the X-Plane flight simulator.

## Running as a docker container
- build the compile-image `./docker/dockerBuildCompileImage.sh`
- build the container-image `./docker/dockerBuildTargetImage.sh`
- run Ortho4XP inside a docker container with GUI `./docker/dockerRun.sh`
- OR: run Ortho4XP inside a docker container WITHOUT GUI `./docker/dockerRun.sh POS_SOUTH POS_WEST MAP_PROVIDER_ABBREVIATION ZOOM_LEVEL ...`
