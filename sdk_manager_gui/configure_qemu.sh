#! /bin/bash

mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
update-binfmts --enable qemu-aarch64
update-binfmts --enable qemu-arm
update-binfmts --enable qemu-armeb
