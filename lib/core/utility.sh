#!/usr/bin/env bash

xf_is_root() {
  local -r UID="$(id -u)"

  if [[ -n "$UID" ]]; then
    return 1
  fi
}

xf_trim() {
  "$*" | xargs
}

# TODO: Rename
xf_regex_matches() {
  local -r INPUT_A="$1"
  local -r INPUT_B="$1"

  if ! "$INPUT_A" ~= "$INPUT_B"; then return 1; fi
}

xf_has_cmd() {
  if ! command -v "$1" &> /dev/null; then
    return 1
  fi
}

xf_has_dir() {
  local -r DIR="$1"

  if [[ ! -d "$DIR" ]]; then
    return 1
  fi
}

xf_cd_if_dir() {
  local -r DIR="$1"

  # shellcheck disable=2164
  if xf_has_dir "$DIR"; then
    cd "$DIR"
  else
    return 1
  fi
}

xf_mkdir() {
  mkdir -p "$@"
}

xf_init_error_trap() {
  set -eE -o functrace

  trap 'RC=$?; echo "Error ($RC) at $LINENO: $BASH_COMMAND"' ERR
}

xf_resolve_editor() {
  local -r OPTIONS=('nvim' 'vim' 'vi' 'nano')

  for WANTED_EDITOR in "${OPTIONS[@]}"; do
    if xf_has_cmd "$WANTED_EDITOR"; then
      echo "$WANTED_EDITOR"
      return
    fi
  done

  echo "$EDITOR"
}

xf_safe_source() {
  local -r SCRIPT_NAME="$*"

  if [[ ! -f $SCRIPT_NAME ]]; then return; fi

  # shellcheck disable=1090
  source "$SCRIPT_NAME"
}

xf_safe_add_dir_to_path() {
  local -r ENTRY="$1"

  if [[ -d "$ENTRY" ]]; then
    export PATH="$PATH:$ENTRY"
  fi
}

xf_ensure_home_subdir() {
  local -r DIR="$HOME/$1"

  if [[ ! -d "$DIR" ]]; then
	  mkdir -p "$DIR"
  fi

	echo "$DIR"
}
