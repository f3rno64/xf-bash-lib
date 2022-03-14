#!/usr/bin/env bash

jctl() {
  sudo journalctl -u "$@"
}

jctlf() {
  jctl -f
}
