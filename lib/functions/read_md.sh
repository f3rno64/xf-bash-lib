#!/usr/bin/env bash

readmd() {

  if ! xf_has_cmd "glow"; then
    echo "glow executable not found"
    return 1
  fi

  if ! xf_has_cmd "moar"; then
    echo "moar executable not found"
    return 1
  fi

  local -r FN="$1"

  if [[ -z "$1" ]]; then
    echo "markdown file required as first argument"
    return 1
  fi

  cat "$1" | glow | moar
}
