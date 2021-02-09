#!/usr/bin/env bash

xf_has_rust() {
  xf_has_dir "$HOME/.cargo"
}

xf_rust_init() {
  if ! xf_has_rust; then return; fi

  export CARGO_PATH="$HOME/.cargo"
  export CARGO_BIN_PATH="$CARGO_PATH/bin"

  xf_safe_add_dir_to_path "$CARGO_BIN_PATH"
}
