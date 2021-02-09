#!/usr/bin/env bash

xf_has_nvm() {
  xf_has_dir "$NVM_PATH"
}

xf_nvm_init() {
  if ! xf_has_nvm; then return; fi

  xf_safe_source "$(xf_git_repo_path 'dsifford' 'yarn-completion')/yarn-completion.bash"
  xf_safe_source "$NVM_PATH/nvm.sh"
  xf_safe_source "$NVM_PATH/bash_completion"

  xf_safe_add_dir_to_path "$(xf_get_nvm_latest_node_version_bin_path)"

  # shellcheck disable=1090
  source <(npm completion)
}

xf_get_nvm_latest_node_version() {
  local -r NVM_NODE_ROOT_PATH="$NVM_PATH/versions/node"

  if ! xf_has_nvm; then
    echo "No nvm installation found (expected in $NVM_PATH)"
    return
  fi

  if ! xf_has_dir "$NVM_NODE_ROOT_PATH"; then
    echo "No node installed via nvm (see $NVM_PATH)"
    return
  fi

  # shellcheck disable=2012
  ls -1 -t "$NVM_NODE_ROOT_PATH" | head -n2 | tail -n1
}

xf_get_nvm_latest_node_version_bin_path() {
  echo "$(xf_get_nvm_latest_node_version)/bin"
}
