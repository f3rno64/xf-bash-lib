#!/usr/bin/env bash
# shellcheck disable=1090

xf_is_root() {
  local -r UID="$(id -u)"

  if [[ -n "$UID" ]]; then
    return 1
  fi
}

xf_is_link() {
  local -r PATH="$1"

  if [[ ! -h "$PATH" ]]; then return 1; fi
}

xf_is_file() {
  local -r PATH="$1"

  if [[ ! -f "$PATH" ]]; then return 1; fi
}

xf_is_dir() {
  local -r PATH="$1"

  if [[ ! -d "$PATH" ]]; then return 1; fi
}

xf_trim() {
  echo "$*" | xargs
}

# TODO: Rename
xf_regex_matches() {
  local -r INPUT_A="$1"
  local -r INPUT_B="$2"

  if [[ ! "$INPUT_A" =~ $INPUT_B ]]; then return 1; fi
}

xf_has_cmd() {
  if ! command -v "$1" &> /dev/null; then
    return 1
  fi
}

xf_link_to_null() {
  local -r SOURCE="$1"
  local -r VERBOSE="${2:-1}"

  if xf_is_link "$SOURCE"; then
    if "$VERBOSE"; then
      echo "$SOURCE is already a symbolic link"
    fi

    return 1
  fi

  if xf_is_file "$SOURCE"; then
    rm "$SOURCE"
  fi

  ln -s /dev/null "$SOURCE"

  if "$VERBOSE"; then
    echo "Linked $SOURCE to /dev/null"
  fi
}

# TODO: Refactor out
xf_has_dir() {
  if ! xf_is_dir "$1"; then return 1; fi
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
  local -r ARGS=("$@")
  local -r SCRIPT_NAME="${ARGS[0]}"

  if [[ ! -f "$SCRIPT_NAME" ]]; then return; fi

  if [[ "${#ARGS[@]}" -gt 1 ]]; then
    source "$SCRIPT_NAME" "${ARGS[1]}"
  else
    source "$SCRIPT_NAME"
  fi
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

xf_bash_exec() {
  local -r COMMAND="$1"

  if [[ -z "$COMMAND" ]]; then return 1; fi

  bash -c "$COMMAND"
}
