#!/usr/bin/env bash

if xf_has_cmd 'alder'; then
  alias tree='alder -s --prune'
fi
