#! /bin/bash

run_image () {
  image_name=$1
  run_command=$2

  docker run --rm -it \
    --privileged \
    --net host \
    --ipc host \
    --pid host \
    --user $(id -u):$(id -g) \
    --mount type=bind,source=$HOME,target=$HOME \
    --workdir $HOME \
    --mount type=bind,source=/etc/shadow,target=/etc/shadow,readonly \
    --mount type=bind,source=/etc/passwd,target=/etc/passwd,readonly \
    --mount type=bind,source=/etc/group,target=/etc/group,readonly \
    -e DISPLAY \
    --mount type=bind,source=/tmp/.X11-unix,target=/tmp/.X11-unix \
    --mount type=bind,source=/usr/share/icons,target=/usr/share/icons,readonly \
    -e LANG=C.UTF-8 \
      $image_name $run_command
}

run_image sdk_manager_gui bash
