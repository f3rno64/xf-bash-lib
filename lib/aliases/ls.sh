#!/usr/bin/env bash
#
# shellcheck disable=2010
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

LS_CMD_ARGS=(
  '--color=auto'
  '-h'
)

# }}}

# {{{ xf_arr_append_ls_cmd_args

xf_arr_append_ls_cmd_args() {
  for ARG in "$@"
  do
    LS_CMD_ARGS+=("$ARG")
  done
}

# }}}
# {{{ xf_arr_append_ls_cmd_args_if_supported

xf_arr_append_ls_cmd_args_if_supported() {
  local -r ARG="$1"
  local -r ARG_HELP="$(ls --help | grep "$ARG")"

  if [[ -n "$ARG_HELP" ]]; then
    xf_arr_append_ls_cmd_args "$ARG"
  fi
}

# }}}

# {{{ add --group-directories-first if supported

xf_arr_append_ls_cmd_args_if_supported '--group-directories-first'

# }}}

# {{{ aliases

LS_CMD_ARGS_STR="$(IFS=, ; echo "${LS_CMD_ARGS[*]}")"

alias ls="\$LS_CMD_ARGS_STR"
alias ll="\$LS_CMD_ARGS_STR -al"
alias lt="\$LS_CMD_ARGS_STR -alt"
alias lh="\$LS_CMD_ARGS_STR -alt .*"

# }}}
