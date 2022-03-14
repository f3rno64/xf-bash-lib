#! /usr/bin/env bash

if xf_has_cmd 'nvim'; then
  alias nvim="nvim -u ~/.config/nvim/init.nvim"
fi

if xf_has_cmd 'nvim-gtk'; then
  alias nvim-gtk="nvim-gtk -- -u ~/.config/nvim/ginit.vim"
fi
