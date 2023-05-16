#!/usr/bin/env bash
# shellcheck source-path=.

DIR=$(dirname "${BASH_SOURCE[0]}")

source "$DIR/bashrc/black.sh"
source "$DIR/bashrc/git.sh"
source "$DIR/bashrc/pass.sh"
source "$DIR/bashrc/yarn.sh"
source "$DIR/bashrc/fzf.sh"
source "$DIR/bashrc/maven.sh"
source "$DIR/bashrc/perl.sh"

popd &> /dev/null || return
