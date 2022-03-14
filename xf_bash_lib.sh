#!/usr/bin/env bash
# shellcheck disable=1090

# To be checked by other scripts for lib presence
export XF_BASH_LIB=1

source "$XF_BASH_LIB_PATH/lib/init.sh"
source "$XF_BASH_LIB_PATH/lib/core.sh"
source "$XF_BASH_LIB_PATH/lib/bashrc.sh"

xf_init

source "$XF_BASH_LIB_PATH/lib/functions.sh"
source "$XF_BASH_LIB_PATH/lib/aliases.sh"
