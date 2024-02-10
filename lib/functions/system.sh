#!/usr/bin/env bash

shutdn() {
  shutdown -h -P now
}

kk() {
  if [[ -z "$1" ]]; then
    echo "Usage: kk <process-name>"
    return 1
  fi

  sudo killall "$1" -9
}

mnt() {
  if [[ -z "$1" ]]; then
    echo "Usage: mnt <device>"
    return 1
  fi

  sudo mount "/dev/$1" /mnt
}

umnt() {
  sudo unmount /mnt
}

