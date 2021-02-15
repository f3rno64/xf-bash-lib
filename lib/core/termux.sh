#! /usr/bin/env bash

xf_is_termux() {
  xf_regex_matches "$HOME" '/termux/'
}
