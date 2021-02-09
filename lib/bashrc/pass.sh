#!/usr/bin/env bash

if ! xf_has_pass; then return; fi

# TODO: Generate these based on dir structure

pass-gen() {
  pass generate "$@"
  pass -c "$@"
  clear
}

pass-gg() {
  pass -c g/google
  pass otp g/google/otp
}

pass-npm() {
  pass -c g/npm
  pass otp g/npm/otp
}

pass-fb() {
  pass -c s/facebook
  pass otp s/facebook/otp
}

pass-pm() {
  pass -c s/protonmail
  pass otp s/protonmail/otp
}

pass-gh() {
  pass -c g/github
  pass otp g/github/otp
}

pass-bfx() {
  pass -c crypto/bitfinex
  pass otp crypto/bitfinex/otp
}

pass-tw() {
  pass -c s/twitter
  pass otp s/twitter/otp
}
