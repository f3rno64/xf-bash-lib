#!/usr/bin/env bash

xf_has_pass() {
  xf_has_cmd 'pass'
}

xf_pass_init() {
  if ! xf_has_pass; then return; fi

  local -r PW_STORE_PATH="$(xf_ensure_home_subdir '.password-store')"
  local -r PW_STORE_ENV_SH="$PW_STORE_PATH/.env"

  export PASSWORD_STORE="$PW_STORE_PATH"

  if [[ -x "$PW_STORE_ENV_SH" ]]; then
  	export PASSWORD_STORE_ENABLE_EXTENSIONS=true

    xf_safe_source "$PW_STORE_ENV_SH"
  fi
}
