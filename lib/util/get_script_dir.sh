#! /usr/bin/env bash
# shellcheck disable=2164
# shellcheck disable=2086
# shellcheck disable=2005

xf_get_script_dir() {
  local -r SOURCE_FN="${1:${BASH_SOURCE[0]}}"
  local -r THIS_DIR="${2:(dirname -- "$SOURCE_FN")}"
  local -r SCRIPT_DIR="$(cd -- "$(dirname -- "$THIS_DIR")")"

  echo "$(cd -- $SCRIPT_DIR &> /dev/null && pwd)"
}
