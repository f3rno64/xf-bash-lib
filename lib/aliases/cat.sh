#! /usr/bin/env bash

BAT_THEME='gruvbox-light'

if xf_has_cmd 'bat'; then
  alias cat="bat --theme \$BAT_THEME"

  xf_log_success "aliased cat as bat"
fi
