#!/usr/bin/env bash
# shellcheck source-path=./bashrc

DIR="$(dirname $BASH_SOURCE[0])"

source "$DIR/bashrc/git.sh"
source "$DIR/bashrc/pass.sh"
source "$DIR/bashrc/yarn.sh"
source "$DIR/bashrc/fzf.sh"
source "$DIR/bashrc/maven.sh"
source "$DIR/bashrc/perl.sh"

popd &> /dev/null || return
