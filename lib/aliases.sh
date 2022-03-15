#!/usr/bin/env bash
# shellcheck source-path=./aliases

pushd ./aliases &> /dev/null || return

source "./cat.sh"
source "./grep.sh"
source "./ls.sh"
source "./vim.sh"

popd &> /dev/null || return
