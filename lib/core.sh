#!/usr/bin/env bash
# shellcheck source-path=./core

pushd ./core &> /dev/null || return

source "./utility.sh"
source "./termux.sh"
source "./pass.sh"
source "./fzf.sh"
source "./gh.sh"
source "./git.sh"
source "./go.sh"
source "./nvm.sh"
source "./rust.sh"
source "./rvm.sh"
source "./snap.sh"
source "./vim.sh"
source "./yarn.sh"

popd &> /dev/null || return
