#! /usr/bin/env bash
# shellcheck disable=2164
# shellcheck disable=2086
# shellcheck disable=2005

xf_get_script_dir() {
  local -r SOURCE_FN="${1:${BASH_SOURCE[0]}}"
  local -r THIS_DIR="$(dirname -- "$SOURCE_FN")"
  local -r FINAL_DIR="${2:$THIS_DIR}"
  local -r SCRIPT_DIR="$(cd -- "$(dirname -- "$FINAL_DIR")")"

  echo "$(cd -- $SCRIPT_DIR &> /dev/null && pwd)"
}
