#! /usr/bin/env bash

xf_get_script_dir() {
  local -r SOURCE_FN="${1:${BASH_SOURCE[0]}}"
  local -r THIS_DIR="${2:(dirname -- "$SOURCE_FN")}"
  local -r SCRIPT_DIR="$(cd -- "$(dirname -- "$THIS_DIR")")"

  echo "$(cd -- $SCRIPT_DIR &> /dev/null && pwd)"
}
