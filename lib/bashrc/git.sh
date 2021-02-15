#!/usr/bin/env bash
# TODO: Add helper to add remote, for PRs (automate fetch as well)

if ! xf_has_git; then return; fi

export GIT_USER="$USER"
export GIT_EDITOR="$EDITOR"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export GIT_DEFAULT_IGNORED=('Session.vim' '.undodir' 'notes')

alias gc='xf_git_clone'

gnew() {
  if xf_has_dir "$(pwd)/.git"; then
    echo $?
    echo "$(pwd)/.git"
    echo 'This directory already contains a git repo'
    return
  fi

  local -r FOLDER_NAME="$(pwd | sed -r 's/^.*\/(.*)$/\1/')"
  local -r REPO_NAME="${1:-$FOLDER_NAME}"
  local -r USER="${2:-$GIT_USER}"
  local -r HOST_NAME="${3:-$XF_DEFAULT_GIT_HOSTNAME}"
  local -r URL="git@$HOST_NAME:$GIT_USER/$REPO_NAME.git"

  git init .
  git remote add origin "$URL"

  touch .gitignore

  for ENTRY in "${GIT_DEFAULT_IGNORED[@]}"; do
    echo "$ENTRY" >> .gitignore
  done
}

gs() {
  git status
}

gcgh() {
  local -r DEST="$(xf_git_get_repo_path "$*")"

  if xf_has_dir "$DEST"; then
    echo "Directory not empty: $DEST"
  else
    mkdir -p "$DEST"

    if ! cd "$DEST"; then
      echo "Failed to change directory: $DEST"
      return
    fi

    xf_git_clone "$*"
  fi
}

gf() {
  local -r ORIGIN="${1:-'origin'}"
  local -r REMOTE_BRANCH="${2:-'master'}"
  local -r LOCAL_BRANCH="${3:-"$REMOTE_BRANCH"}"

  git fetch "$ORIGIN" "$REMOTE_BRANCH":"$LOCAL_BRANCH"
}

gp() {
  git push -u origin HEAD --tags
}

gpf() {
  git push -u origin HEAD --force
}

gcam() {
  git commit -am "$1"
}

gcm() {
  git commit -m "$1"
}

gl() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

ga() {
  git add -p "$@"
}

gd() {
  git diff "$@"
}
