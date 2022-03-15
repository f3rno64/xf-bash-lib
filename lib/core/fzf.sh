#!/usr/bin/env bash

declare -a -r FZF_ARGS=(
  '--hidden'
  '--ignore-dir=.git'
  '--ignore-dir=.undodir'
  '--ignore-dir=docs/dist'
  '--ignore-dir=node_modules'
  '--ignore-dir=bower_components'
  '--ignore-dir=dist'
  '-g ""'
)

xf_has_fzf() {
  xf_has_cmd 'fzf'
}

xf_fzf_init() {
  if ! xf_has_fzf; then return; fi

  export FZF_DEFAULT_COMMAND="ag ${FZF_ARGS[*]}"

  xf_safe_source "$HOME/.fzf.bash"
  xf_log_success "init fzf"
}
