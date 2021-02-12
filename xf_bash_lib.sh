#!/usr/bin/env bash

# To be checked by other scripts for lib presence
export XF_BASH_LIB=1

# shellcheck disable=1090
source "$XF_BASH_LIB_PATH/lib/core.sh"

# xf_init_error_trap
xf_fzf_init
xf_gh_init
xf_go_init
xf_nvm_init
xf_pass_init
xf_rust_init
xf_rvm_init
xf_snap_init

# shellcheck disable=1090
source "$XF_BASH_LIB_PATH/lib/bashrc.sh"
