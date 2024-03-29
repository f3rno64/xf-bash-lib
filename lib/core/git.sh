#!/usr/bin/env bash

XF_DEFAULT_GIT_HOSTNAME='github'

xf_has_git() {
  xf_has_cmd 'git'
}

xf_git_repo_path() {
  local -r ARGC="${#@}"

  if [[ "$ARGC" == 1 ]]; then
    local -r OWNER="${1:-$USER}"
    local -r REPO="$OWNER"
    local -r HOST="$XF_DEFAULT_GIT_HOSTNAME"
  elif [[ "$ARGC" == 2 ]]; then
    local -r OWNER="${1:-$USER}"
    local -r REPO="$2"
    local -r HOST="$XF_DEFAULT_GIT_HOSTNAME"
  elif [[ "$ARGC" == 3 ]]; then
    local -r OWNER="$1"
    local -r REPO="$2"
    local -r HOST="$3"
  else
    return 1
  fi

  echo "$XF_SRC_DIR/$HOST/$OWNER/$REPO"
}

xf_git_current_branch() {
  local -r BRANCH="$(git branch --no-color --show-current | xargs)"

  echo -n "$BRANCH"
}

# TODO: Improve username check
xf_git_is_own_repo() {
  local -r REPO="$1"
  local -r REGEX="/$USER/"

  if [[ ! $REPO =~ $REGEX ]]; then
    return 1
  fi
}

xf_git_get_clone_options() {
  local -r REPO="$1"
  local -r OPTIONS='--recursive --progress --tags -j 8'

  if xf_git_is_own_repo "$REPO"; then
    echo "$OPTIONS"
  else
    echo "$OPTIONS --depth=1"
  fi
}

xf_git_get_repo_path() {
  local -r REPO="$1"
  local -r HOST="${2:-$XF_DEFAULT_GIT_HOSTNAME}"

  echo "$XF_SRC_DIR/$HOST/$REPO"
}

xf_git_get_repo_url() {
  local -r REPO="$1"

  if xf_git_is_own_repo "$REPO"; then
    echo "git*github.com:$REPO"
  else
    echo "https://github.com/$REPO"
  fi
}

xf_git_clone() {
  local -r REPO="$1"
  local -r REPO_URL="$(xf_git_get_repo_url "$REPO")"
  local -r OPTIONS="$(xf_git_get_clone_options "$REPO")"
  local -r CLONE_ARGS="$OPTIONS $REPO_URL ."

  if xf_git_is_own_repo "$REPO"; then
    xf_sshpass_decrypt_prefix_exec_git "$CLONE_ARGS"
  else
    xf_bash_exec "git clone $CLONE_ARGS"
  fi
}
