#!/usr/bin/env bash

xf_has_snap() {
  xf_has_cmd 'snap'
}

xf_snap_init() {
  if ! xf_has_snap; then return; fi

  xf_safe_add_dir_to_path '/snap/bin'
  xf_log_success "init snap"
}
