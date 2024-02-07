#! /usr/bin/env bash

if xf_has_nvim; then
  alias nvim="nvim -u \$XF_NVIM_CONFIG_PATH"
  alias nv="nvim -u \$XF_NVIM_CONFIG_PATH"

  xf_log_success "added nvim alias"
fi

if xf_has_nvim_gtk; then
  alias nvim-gtk="nvim-gtk -- -u \$XF_NVIM_GTK_CONFIG_PATH"
  xf_log_success "added nvim-gtk alias"
fi
