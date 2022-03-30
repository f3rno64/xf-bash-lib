#!/usr/bin/env bash

# {{{ base grep command arguments

UNAME="$(uname -a)"

if [[ "$UNAME" =~ Darwin ]]; then
  GREP_CMD_ARGS=(
    '--color=always'
  )
else
  GREP_CMD_ARGS=(
    '--color=always'
    '--group-seperator=|'
  )
fi

# }}}
# {{{ configuration

GREP_CMD_ARGS_STR="$(IFS=" "; echo "${GREP_CMD_ARGS[*]}")"
GREP_CONTEXT_SIZE_LN=20

# }}}
# {{{ aliases

alias gr="grep \$GREP_CMD_ARGS_STR"
alias grn="gr -B \$GREP_CONTEXT_SIZE_LN"
alias gra="gr -A \$GREP_CONTEXT_SIZE_LN"

xf_log_success "added grep aliases"

# }}}
