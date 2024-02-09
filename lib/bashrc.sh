#!/usr/bin/env bash
# shellcheck source-path=.

DIR=$(dirname "${BASH_SOURCE[0]}")

source "$DIR/bashrc/perl.sh"

popd &> /dev/null || return
