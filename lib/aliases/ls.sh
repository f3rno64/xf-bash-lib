#!/usr/bin/env bash
#
# shellcheck disable=2010
# shellcheck disable=2139
#
# We call `ls --help` to check for dir group support
#
# Adds helpful ls aliases:
#
# * ls - base ls command
# * ll - list all as vertical list
# * lt - list all as vertical listing, most recent first
# * lh - list only hidden files (as `la`)
#
# Uses lsd if it is available, otherwise uses the builtin ls command.

# {{{ base ls and lsd command arguments

LS_HELP="$(ls -h)"
LSD_HELP="$(lsd -h)"

declare -a LSD_BASE_CMD_ARGS=(
  '-h'
  '-A'
  '-F'
  '-L'
  '--total-size'
  '--no-symlink'
  '--color=always'
  '--date relative'
)

declare -a LS_BASE_CMD_ARGS=(
  '--color=always'
  '-h'
)

# }}}
# {{{ add --group-directories-first arg if supported to LSD_CMD_ARGS

if [[ "$LSD_HELP" =~ '--group-directories-first' ]]; then
  LSD_CMD_ARGS="${LSD_BASE_CMD_ARGS[*]}"
  LSD_CMD_ARGS+=('--group-directories-first')

  xf_log_success "lsd will group directories"
fi

# }}}
# {{{ add --group-directories-first arg if supported to LS_CMD_ARGS

if [[ "$LS_HELP" =~ '--group-directories-first' ]]; then
  LS_CMD_ARGS="${LS_BASE_CMD_ARGS[*]}"
  LS_CMD_ARGS+=('--group-directories-first')

  xf_log_success "ls will group directories"
fi

# }}}
# {{{ aliases

LSD_CMD_ARGS_STR="$(IFS=" "; echo "${LSD_CMD_ARGS[*]}")"
LS_CMD_ARGS_STR="$(IFS=" "; echo "${LS_CMD_ARGS[*]}")"

if xf_has_cmd 'lsd'; then
  alias ls="lsd $LSD_CMD_ARGS_STR"
  alias ll="lsd $LSD_CMD_ARGS_STR -l"
  alias lla="lsd $LSD_CMD_ARGS_STR -l -a"
  alias lt="lsd $LSD_CMD_ARGS_STR -l -t"
  alias lta="lsd $LSD_CMD_ARGS_STR -l -t -a"
  alias lh="lsd $LSD_CMD_ARGS_STR -l -t .*"
  alias lh="lsd $LSD_CMD_ARGS_STR -l -t -a .*"

  xf_log_success 'added ls aliases using lsd'
else
  alias ls="ls $LS_CMD_ARGS_STR"
  alias ll="ls $LS_CMD_ARGS_STR -l"
  alias lla="ls $LS_CMD_ARGS_STR -l -a"
  alias lt="ls $LS_CMD_ARGS_STR -l -t"
  alias lta="ls $LS_CMD_ARGS_STR -l -t -a "
  alias lh="ls $LS_CMD_ARGS_STR -l -t .*"
  alias lha="ls $LS_CMD_ARGS_STR -l -t -a .*"

  xf_log_success 'added ls aliases'
fi

# }}}
