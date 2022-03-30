#!/usr/bin/env bash
# shellcheck disable=1090
# shellcheck source-path=./lib

DIR=$(dirname "${BASH_SOURCE[0]}")

source "$DIR/vendor/bash_colors/bash_colors.sh"
source "$DIR/lib/util/get_script_dir.sh"
source "$DIR/lib/core.sh"
source "$DIR/bashrc.sh"
source "$DIR/functions.sh"
source "$DIR/aliases.sh"

xf_pass_init
xf_fzf_init
xf_gh_init
xf_go_init
xf_nvm_init
xf_rust_init
xf_rvm_init
xf_snap_init

xf_log_success 'init xf-bash-lib'
