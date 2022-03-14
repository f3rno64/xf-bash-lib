#!/usr/bin/env bash
#
# TODO: Consider disabled functionality

tmn() {
  # export ACTIVE_TMUX_SESSION_NAME=${$1:-T}

  tmux new -s T
}

tma() {
  # SESSIONS="$(tmux list-sessions -F '{#session_name}')"
  # SESSION_NAME_OR_INDEX="${$1:-0}"

  tmux attach -t T
}
