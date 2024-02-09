#! /usr/bin/env bash

if xf_has_cmd 'fcp'; then
  alias cp="fcp"

  xf_log_success "aliased cp as fcp"
fi

if xf_has_cmd 'pycp'; then
  alias cppg="pycp -i -p -g"
  xf_log_success "aliased cppg as pycp -i -p -g"

  alias cp-progress="pycp -i -p -g"
  xf_log_success "aliased cp-progress as pycp -i -p -g"
fi
