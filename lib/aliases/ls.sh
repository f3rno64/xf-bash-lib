#!/usr/bin/env bash
#
# shellcheck disable=2010
# shellcheck disable=2139
#
# We call `ls --help` to check for dir group support
#
# Adds helpful ls aliases:
#
# * ls - base ls command unconfigured
# * ll - list all as vertical list
# * la - list all as vertical listing
# * lt - list all as vertical listing, most recent first
# * lh - list only hidden files (as `la`)

# {{{ base ls command arguments

LS_HELP="$(ls -h)"

declare -a LS_CMD_ARGS=(
  '--color=always'
  '-h'
)

# }}}
# {{{ add --group-directories-first if supported

if [[ "$LS_HELP" =~ '--group-directories-first' ]]; then
  LS_CMD_ARGS+=('--group-directories-first')

  xf_log_success "ls alias will group directories"
fi

# }}}
# {{{ aliases

LS_CMD_ARGS_STR="$(IFS=" "; echo "${LS_CMD_ARGS[*]}")"

if command -v lsd >/dev/null 2>&1; then
  alias ls="lsd $LS_CMD_ARGS_STR"
  alias ll="lsd -al"
  alias lt="lsd -alt"
  alias lh="lsd -alt .*"
else
  alias ls="ls $LS_CMD_ARGS_STR"
  alias ll="ls -al"
  alias lt="ls -alt"
  alias lh="ls -alt .*"
fi

xf_log_success "added ls aliases"

# }}}
