#!/usr/bin/env bash

xf_has_fzf() {
  xf_has_cmd 'fzf'
}

# TODO: Use array for list of ignore directories
xf_fzf_init() {
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir={.git,.undodir,docs/dist,node_modules,bower_components,dist} -g ""'

  xf_safe_source "$HOME/.fzf.bash"
}
