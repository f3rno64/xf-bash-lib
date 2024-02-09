#! /usr/bin/env bash

if xf_has_cmd 'fcp'; then
  alias cp="fcp"

  xf_log_success "aliased cp as fcp"
fi
