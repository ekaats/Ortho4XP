#!/usr/bin/bash

# CREATE THE REQUIRED LOCAL(!) BUILD DIR (IF NOT PRESENT) TO HAVE ACCESS TO THE GENERATED CONTENT FROM THE OUTSIDE OF
# THE CONTAINER.
mkdir -p build

# ALLOW ALL LOCAL USERS TO CONNECT TO CURRENT USERS DISPLAY
xhost + local:

# RUN THE CONTAINER WITH AND WITHOUT UI
# (IF WITH UI THEN THIS IS THE WAYLAND WAY!)

# shellcheck disable=SC2068
# we need re-splitting here
podman run                    \
   --interactive              \
   --tty                      \
   --rm                       \
   --cpus 4                   \
   --user "$(id -u):$(id -g)" \
                              \
   --volume XAUTHORITY:"$XAUTHORITY":ro          \
   --volume /tmp/.X11-unix:/tmp/.X11-unix:ro     \
   --userns keep-id                              \
   --env    "DISPLAY"                            \
   --security-opt label=type:container_runtime_t \
                                                 \
   --volume "$(pwd)/Ortho4XP.cfg:/app/Ortho4XP.cfg:rw" \
   --volume "$(pwd)/build:/app/build"                  \
   o4xp                                                \
   $@
