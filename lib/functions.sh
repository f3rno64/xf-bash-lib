#!/usr/bin/env bash
# shellcheck source-path=./functions

DIR=$(dirname "${BASH_SOURCE[0]}")

source "$DIR/functions/gh.sh"
source "$DIR/functions/git.sh"
source "$DIR/functions/fzf.sh"
source "$DIR/functions/yarn.sh"
source "$DIR/functions/tmux.sh"
source "$DIR/functions/pnpm.sh"
source "$DIR/functions/system.sh"
source "$DIR/functions/utility.sh"
source "$DIR/functions/read_md.sh"
source "$DIR/functions/packages.sh"
source "$DIR/functions/systemctl.sh"
source "$DIR/functions/journalctl.sh"
source "$DIR/functions/build_utils.sh"
source "$DIR/functions/bluetoothctl.sh"
