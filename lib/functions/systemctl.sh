#!/usr/bin/env bash

sysup() {
  sudo systemctl start "$@"
}

sysdn() {
  sudo systemctl stop "$@"
}

sysre() {
  sudo systemctl restart "$@"
}

sysst() {
  sudo systemctl status "$@"
}

syson() {
  sudo systemctl enable "$@"
}

sysoff() {
  sudo systemctl disable "$@"
}
