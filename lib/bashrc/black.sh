#! /usr/bin/env bash

if xf_has_cmd "black"; then
  black() {
    ~/.local/bin/black --line-length 79 --fast "$@"
  }
fi
