#!/usr/bin/env bash

if ! xf_has_fzf; then return; fi

fzf-cd() {
  local -r FZF_RES="$(fzf)"

  if [[ -z "$FZF_RES" ]]; then return; fi

  local -r FZF_RES_PATH="./$FZF_RES"

  if [[ -d "$FZF_RES_PATH" ]]; then
    cd "$FZF_RES_PATH" || return
  else
    cd "$(dirname "$FZF_RES_PATH")" || return
  fi
}
