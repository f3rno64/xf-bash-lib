#! /usr/bin/env bash

black() {
  ~/.local/bin/black --line-length 79 --fast "$@"
}
