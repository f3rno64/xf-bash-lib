#!/usr/bin/env bash

xf_has_rvm() {
  xf_has_dir "$HOME/.rvm"
}

xf_rvm_init() {
  if ! xf_has_rvm; then return; fi

  export RVM_PATH="$HOME/.rvm"
  export RUBY_BIN_PATH="$RVM_PATH/rubies/default/bin"
  export GEM_BIN_PATH="$RVM_PATH/gem/default/bin"

  xf_safe_add_dir_to_path "$RVM_PATH"
  xf_safe_add_dir_to_path "$GEM_BIN_PATH"
  xf_safe_add_dir_to_path "$RUBY_BIN_PATH"
}
