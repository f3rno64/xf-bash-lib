#!/usr/bin/env bash
# shellcheck disable=1090
# shellcheck source-path=./lib

source "./vendor/bash_colors/bash_colors.sh"

pushd ./lib &> /dev/null || return

source "./core.sh"
source "./bashrc.sh"
source "./functions.sh"
source './aliases.sh'

xf_pass_init
xf_fzf_init
xf_gh_init
xf_go_init
xf_nvm_init
xf_rust_init
xf_rvm_init
xf_snap_init

xf_log_success 'init xf-bash-lib'

popd &> /dev/null || return
