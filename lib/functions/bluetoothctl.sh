#!/usr/bin/env bash

if (xf_has_cmd 'bluetoothctl') then
  btctl() {
    bluetoothctl
  }
fi
