#! /usr/bin/env bash
#
# Defines shortcuts for the system package manager.
#
# Shortcuts:
# * pkgi - install a package
# * pkgu - update a package
# * pkgd - uninstall a package
# * pkgr - alias for pkgd
# * pkgs - search for a package
#
# Supports:
# * Fedora
# * Arch
# * Debian/Ubuntu
# * Termux
# * MacOS Homebrew

# {{{ configuration

XF_PKG_FEDORA_BIN='dnf'
XF_PKG_ARCH_BIN='pacman'
XF_PKG_DEBIAN_BIN='apt'
XF_PKG_HOMEBREW_BIN='brew'
XF_PKG_TERMUX_BIN='pkg'

# }}}

# {{{ fedora

XF_PKG_CMDS_FEDORA=(
  "dnf install -y"
  "dnf update -y"
  "dnf remove -y"
  "dnf search"
)

# }}}
# {{{ arch

XF_PKG_CMDS_ARCH=(
  "pacman -S"
  "pacman -Syyyuuu"
  "pacman -R"
  "pacman -Q"
)

# }}}
# {{{ debian

XF_PKG_CMDS_DEBIAN=(
  "apt install"
  "apt update --refresh && apt upgrade"
  "apt uninstall"
  "apt search"
)

# }}}
# {{{ termux

XF_PKG_CMDS_TERMUX=(
  "pkg install -y"
  "pkg update -y && pkg upgrade -y"
  "pkg remove -y"
  "pkg search"
)

# }}}
# {{{ homebrew

XF_PKG_CMDS_HOMEBREW=(
  "brew install -y"
  "brew update"
  "brew remove"
  "brew search"
)

# }}}

# {{{ xf_pkg_install

xf_pkg_install() {
  bash -c "${XF_PKG_CMDS[0]} $*"
}

# }}}
# {{{ xf_pkg_uninstall

xf_pkg_uninstall() {
  bash -c "${XF_PKG_CMDS[2]} $*"
}

# }}}
# {{{ xf_pkg_update

xf_pkg_update() {
  bash -c "${XF_PKG_CMDS[1]} $*"
}

# }}}
# {{{ xf_pkg_search

xf_pkg_search() {
  bash -c "${XF_PKG_CMDS[3]} $*"
}

# }}}

# {{{ xf_pkg_shortcuts

xf_pkg_shortcuts() {
  pkgi() {
    xf_pkg_install "$@"
  }

  pkgs() {
    xf_pkg_search "$@"
  }

  pkgu() {
    xf_pkg_update "$@"
  }

  pkgd() {
    xf_pkg_uninstall "$@"
  }

  pkgr() {
    pkgd "$@"
  }
}

# }}}
# {{{ xf_get_pkg_cmds

xf_get_pkg_cmds() {
  if xf_has_cmd "$XF_PKG_FEDORA_BIN"; then
    return "${XF_PKG_CMDS_FEDORA[@]}"
  elif xf_has_cmd "$XF_PKG_ARCH_BIN"; then
    return "${XF_PKG_CMDS_ARCH[@]}"
  elif xf_has_cmd "$XF_PKG_DEBIAN_BIN"; then
    return "${XF_PKG_CMDS_DEBIAN[@]}"
  elif xf_has_cmd "$XF_PKG_HOMEBREW_BIN"; then
    return "${XF_PKG_CMDS_HOMEBREW[@]}"
  elif xf_has_cmd "$XF_PKG_TERMUX_BIN"; then
    return "${XF_PKG_CMDS_TERMUX[@]}"
  fi

  return 0
}

# }}}

# {{{ compatibility check & definition

XF_PKG_CMDS=$(xf_get_pkg_cmds)

if [[ -z "$XF_PKG_CMDS" ]]; then
  return
fi

# }}}

xf_shortcuts "${XF_PKG_CMDS[@]}"
