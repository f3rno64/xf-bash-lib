#!/usr/bin/env bash

xf_has_perl() {
  xf_has_cmd 'perl'
}

xf_get_perl_version() {
  if ! xf_has_perl; then return; fi

  local -r PERL_OUTPUT="$(perl --version | grep version)"
  local -r PERL_VERSION="$($PERL_OUTPUT | awk 'BEGIN { FS =" "} { print +$4 }')"

  echo "$PERL_VERSION"
}

xf_has_perl_5() {
  if ! xf_has_perl; then return; fi

  local -r VERSION="$(xf_get_perl_version)"

  if [[ "$VERSION" != "5" ]]; then
    return 1
  fi
}

xf_perl_init() {
  if ! xf_has_perl_5; then return; fi

  local -r PERL_5_DIR="$HOME/perl5"
  local -r PERL_5_BIN_DIR="$PERL_5_DIR"
  local -r PERL_5_LIB="$PERL_5_DIR/lib/perl5${PERL5LIB:+:"${PERL5LIB}"}"
  local -r PERL_5_LIB_ROOT="${PERL_5_DIR/perl5}${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"

  xf_safe_add_dir_to_path "$PERL_5_BIN_DIR"

  export PERL5LIB="$PERL_5_LIB"
  export PERL_LOCAL_LIB_ROOT="$PERL_5_LIB_ROOT"
  export PERL_MB_OPT="--install_base \"$PERL_5_DIR\""
  export PERL_MM_OPT="INSTALL_BASE=$PERL_5_DIR"
}
