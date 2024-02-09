#!/usr/bin/env bash
# TODO: Add helper to add remote, for PRs (automate fetch as well)

if ! xf_has_git; then return; fi

export GIT_USER="$USER"
export GIT_EDITOR="$EDITOR"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export GIT_DEFAULT_IGNORED=('Session.vim' '.undodir' 'notes')

gpo() {
  local -r CURRENT_BRANCH="$(xf_git_current_branch)"

  git pull origin "$CURRENT_BRANCH"
}

gmpr() {
  local -r PR_ID="$1"
  local -r TARGET_BRANCH="${2:-main}"

  git checkout "$TARGET_BRANCH"
  gh pr checkout "$PR_ID"
  git switch "$TARGET_BRANCH"
  git merge -S --no-ff -
}

gnew() {
  if xf_has_dir "./.git"; then
    echo $?
    echo "./.git"
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

goradd() {
  local -r NAME="${1:remote}"
  local -r URL="$2"

  git remote add "$NAME" "$URL"
}

grsoft() {
  local -r LENGTH="$1"

  git reset --soft HEAD^"$LENGTH"
}

gco() {
  local -r BRANCH="$1"

  git checkout "$BRANCH"
}

gcob() {
  local -r BRANCH="$1"

  git checkout -b "$BRANCH"
}

gc() {
  local -r DEST="$(xf_git_get_repo_path "$*")"

  if xf_has_dir "$DEST"; then
    echo "Directory not empty: $DEST"
    return 1
  fi

  mkdir -p "$DEST"
  echo "Created directory $DEST"

  if ! cd "$DEST"; then
    echo "Failed to change directory: $DEST"
    return 1
  else
    echo "cd $DEST"
  fi

  xf_git_clone "$*"
}

gf() {
  local -r REMOTE_BRANCH="${1:-$(xf_git_current_branch)}"
  local -r LOCAL_BRANCH="${2:-"$REMOTE_BRANCH"}"
  local -r ORIGIN="${3:-origin}"

  git fetch "$ORIGIN" "$REMOTE_BRANCH":"$LOCAL_BRANCH"
}

gp() {
  local -r CURRENT_BRANCH="${1:-$(xf_git_current_branch)}"

  git push -u origin "$CURRENT_BRANCH" --tags
}

gpf() {
  local -r CURRENT_BRANCH="${1:-$(xf_git_current_branch)}"

  git push -u origin "$CURRENT_BRANCH" --force
}

gu() {
  local -r CURRENT_BRANCH="$(xf_git_current_branch)"
  local -r BRANCH="${1:-"$CURRENT_BRANCH"}"

  if [[ -z "$BRANCH" ]]; then
    echo "Resolved no current branch, check the output of 'git branch --show-current'"
    return 1
  fi

  echo "Pulling remote branch $BRANCH..."

  git pull origin "$BRANCH"
}
