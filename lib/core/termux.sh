#! /usr/bin/env bash

xf_is_termux() {
  if xf_regex_matches "$HOME" '/termux/'; then return; fi

  return 1
}
