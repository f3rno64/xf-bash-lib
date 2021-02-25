#!/usr/bin/env bash

xf_has_nvm() {
  if xf_is_termux; then
    echo "In termux, nvm won't be loaded"
    return 1
  fi

  xf_has_dir "$NVM_PATH"
}

xf_nvm_init() {
  if ! xf_has_nvm; then return; fi

  local -r ORIGINAL_PREFIX="$PREFIX"
  unset PREFIX

  xf_safe_source "$(xf_git_repo_path 'dsifford' 'yarn-completion')/yarn-completion.bash"
  xf_safe_source "$NVM_PATH/nvm.sh" '--no-use'
  xf_safe_source "$NVM_PATH/bash_completion"

  export PREFIX="$ORIGINAL_PREFIX"

  xf_nvm_use_latest
  xf_safe_add_dir_to_path "$(xf_nvm_latest_local_bin_path)"

  # shellcheck disable=1090
  source <(npm completion)
}

xf_nvm_remote_versions() {
  nvm ls-remote --no-colors
}

xf_nvm_local_versions() {
  nvm ls --no-alias --no-colors
}

xf_nvm_latest_remote_version() {
  local -r VERSION_A="$(xf_nvm_remote_versions | tail -n1)"
  local -r VERSION_B="${VERSION_A//\*/}"
  local -r VERSION="${VERSION_B//->/}"

  xf_trim "$VERSION"
}

xf_nvm_latest_local_version() {
  local -r VERSION_A="$(xf_nvm_local_versions | tail -n1)"
  local -r VERSION_B="${VERSION_A//\*/}"
  local -r VERSION="${VERSION_B//->/}"

  xf_trim "$VERSION"
}

# Handles termux PREFIX clobbering
xf_nvm_use_latest() {
  if xf_nvm_is_using_latest_local; then return; fi

  local -r LATEST_VERSION="$(xf_nvm_latest_remote_version)"

  if xf_is_termux; then
    local -r ARGS="--delete-prefix $LATEST_VERSION"
  else
    local -r ARGS="$LATEST_VERSION"
  fi

  nvm use default "$ARGS" --silent
}

xf_nvm_is_using_latest_local() {
  local -r LATEST_VERSION="$(xf_nvm_latest_local_version)"
  local -r ACTIVE_VERSION="$(node --version)"

  if ! xf_regex_matches "$LATEST_VERSION" "$ACTIVE_VERSION"; then return 1; fi
}

xf_nvm_latest_local_base_path() {
  local -r LATEST_VERSION="$(xf_nvm_latest_local_version)"

  echo "$NVM_PATH/versions/node/$LATEST_VERSION"
}

xf_nvm_latest_local_bin_path() {
  echo "$(xf_nvm_latest_local_base_path)/bin"
}
