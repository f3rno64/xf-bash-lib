#!/usr/bin/env bash
# shellcheck source-path=./bashrc

pushd ./bashrc &> /dev/null || return

source "./git.sh"
source "./pass.sh"
source "./yarn.sh"
source "./fzf.sh"

popd &> /dev/null || return
