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
    xf_safe_source "$PW_STORE_ENV_SH"
  fi
}

xf_pass_decrypt() {
  local -r PASS_ID="$1"

  if [[ -z "$PASS_ID" ]]; then return 1; fi

  local -r PASS_CLEARTEXT="$(pass "$PASS_ID")"

  echo -n "$PASS_CLEARTEXT"
}

xf_sshpass_decrypt_prefix() {
  local -r PASS_ID="$1"
  local -r PASS_PROMPT="$2"

  if [[ -n "$3" ]]; then
    local -r PASS_CLEARTEXT="$3"
  else
    local -r PASS_CLEARTEXT="$(xf_pass_decrypt "$PASS_ID")"
  fi

  if [[ -z "$PASS_CLEARTEXT" ]]; then return 1; fi

  echo -n "SSHPASS=$PASS_CLEARTEXT sshpass -e -P$PASS_PROMPT"
}

# TODO: Extract constants to root scope
xf_sshpass_decrypt_prefix_git() {
  local -r DEFAULT_GITHUB_SSH_PASS_ID="g/github/ssh"
  local -r PASS_PROMPT_GIT_CLONE="passphrase"
  local -r PASS_ID="$DEFAULT_GITHUB_SSH_PASS_ID"

  xf_sshpass_decrypt_prefix "$PASS_ID" "$PASS_PROMPT_GIT_CLONE"
}

xf_sshpass_decrypt_prefix_exec() {
  local -r PASS_PREFIX="$(xf_sshpass_decrypt_prefix "$*")"
  local -r COMMAND="$*[-1]"

  if [[ -z "$COMMAND" ]]; then return 1; fi

  bash -c "$PASS_PREFIX $COMMAND"
}

xf_sshpass_decrypt_prefix_exec_git() {
  local -r CLONE_ARGS="$1"
  local -r PASS_PREFIX="$(xf_sshpass_decrypt_prefix_git)"

  if [[ -z "$CLONE_ARGS" ]]; then return 1; fi

  bash -c "$PASS_PREFIX git clone $CLONE_ARGS"
}
