#! /usr/bin/env bash

UNAME="$(uname -a)"

if [[ "$UNAME" =~ Darwin ]]; then
  CPU_INFO="$(sysctl -a machdep.cpu)"
  RAW_CORE_COUNT=$(echo "$CPU_INFO" | grep core_count)
  CORE_COUNT=$(echo "$RAW_CORE_COUNT" | awk '{ TS=": " } { print $2 }')
elif [[ -f "/proc/cpuinfo" ]]; then
  CPU_INFO="$(cat /proc/cpuinfo)"
  CORE_COUNT=$(echo "$CPU_INFO" | grep cores | tail -n1 | awk "{ TS=\" \" } { print $4 }")
else
  CORE_COUNT=1
fi

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
