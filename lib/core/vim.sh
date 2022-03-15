#! /usr/bin/env bash

xf_has_vim() {
  local -r RESOLVED="$(xf_resolve_editor)"

  if xf_includes "${XF_VIM_EDITORS[@]}" "$RESOLVED"; then
    return 0
  fi

  return 1
}

xf_has_nvim() {
  if xf_has_editor 'nvim'; then return 0; else return 1; fi
}

xf_has_nvim_gtk() {
  if xf_has_editor 'nvim-gtk'; then return 0; else return 1; fi
}
