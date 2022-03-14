#!/usr/bin/env bash

# {{{ base grep command arguments

GREP_CMD_ARGS=(
  '--color=always'
  '--group-seperator=|'
)

# }}}
# {{{ configuration

GREP_CMD_ARGS_STR="$(IFS=, ; echo "${GREP_CMD_ARGS[*]}")"
GREP_CONTEXT_SIZE_LN=20

# }}}
# {{{ aliases

alias gr="grep \$GREP_CMD_ARGS_STR"
alias gn="grep -B \$GREP_CONTEXT_SIZE_LN"
alias ga="grep -A \$GREP_CONTEXT_SIZE_LN"

# }}}
