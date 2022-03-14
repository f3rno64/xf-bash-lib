#!/usr/bin/env bash

shutdn() {
  shutdown -h -P now
}

kk() {
  sudo killall "$1" -9
}

mnt() {
  sudo mount "/dev/$1" /mnt
}

umnt() {
  sudo unmount /mnt
}

