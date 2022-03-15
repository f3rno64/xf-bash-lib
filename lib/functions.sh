#!/usr/bin/env bash
# shellcheck source-path=./functions

pushd ./functions &> /dev/null || return

source "./system.sh"
source "./tmux.sh"
source "./utility.sh"
source "./packages.sh"
source "./journalctl.sh"
source "./systemctl.sh"

popd &> /dev/null || return
