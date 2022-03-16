#! /usr/bin/env bash

CPU_INFO="$(cat /proc/cpuinfo)"
CORE_COUNT=$(echo "$CPU_INFO" | grep cores | tail -n1 | awk "{ TS=\" \" } { print $4 }")

conf() {
  if [[ -x './configure' ]]; then
    bash -c './configure'
  fi
}

mk() {
  conf
  make -j"$CORE_COUNT"
}

mki() {
  sudo make install
}

cargomk() {
  cargo build --release
}

cargoin() {
  cargo install --path .
}
