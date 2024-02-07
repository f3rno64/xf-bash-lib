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

  return 0
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

xf_ensure_dir() {
  local -r DIR="$1"

  if ! xf_has_dir "$DIR"; then
    xf_mkdir "$DIR"
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
  local -r OPTIONS="$XF_DESIRED_EDITORS"

  for WANTED_EDITOR in "${OPTIONS[@]}"; do
    if xf_has_cmd "$WANTED_EDITOR"; then
      echo "$WANTED_EDITOR"
      return
    fi
  done
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
    export PATH="$ENTRY:$PATH"
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

xf_get_user() {
  if [[ -v $USER ]]; then return "$USER"; fi

  local -r USER="$(whoami)"

  echo "$USER"
}

xf_get_hostname() {
  if [[ -v $HOSTNAME ]]; then return "$HOSTNAME"; fi

  local -r HOSTNAME="$(hostname)"

  echo "$HOSTNAME"
}

XF_USRDBCTL_DIR_REGEX="s/.*: \(.*\)/\1/"

xf_get_home_path() {
  if [[ -v $HOME ]]; then return "$HOME"; fi

  local -r RAW_PATH="$(userdbctl user "$USER" | grep Directory)"
  local -r USER_HOME_PATH="$(printf '"%s"' "$RAW_PATH" | sed \\"$XF_USRDBCTL_DIR_REGEX\\")"

  echo "$USER_HOME_PATH"
}

xf_includes() {
  local -r ARRAY="$1"
  local -r QUERY="$2"

  for i in "${ARRAY[@]}"
  do
    if [[ "$i" -eq "$QUERY" ]]; then
      return 1
    fi
  done

  return 0
}

xf_has_editor() {
  local -r RESOLVED="$EDITOR"
  local -r REQUESTED="$1"

  if xf_has_cmd "$RESOLVED"; then
    if [[ -n "$REQUESTED" ]]; then
      if [[ "$EDITOR" -eq "$REQUESTED" ]]; then
        return 0 # requested editor is $EDITOR
      else
        return 1 # requested editor differs
      fi
    else
      return 0 # no request and $EDITOR not executable
    fi
  else
    return 1 # $EDITOR not executable
  fi
}

xf_echo_array() {
  local -a -r ARRAY=("$*")

  for i in "${ARRAY[@]}"
  do
    echo "$i"
  done
}

# TODO: Improve logging

xf_log_success() {
  if [[ "$XF_LOGGING" -eq 0 ]]; then return; fi

  local -r MSG="$1"

  clr_cyan "> " -n
  clr_green "$MSG"
}

xf_log_error() {
  if [[ "$XF_LOGGING" -eq 0 ]]; then return; fi

  local -r MSG="$1"
  local -r DETAIL="$2"

  clr_cyan "> " -n
  clr_red "$MSG"

  clr_cyan "> " -n
  clr_red "$DETAIL"
}

xf_is_vtty() {
  local -r CURRENT_TTY="$(tty)"

  if [[ "$CURRENT_TTY" =~ vtty ]]; then
    return 0
  else
    return 1
  fi
}
