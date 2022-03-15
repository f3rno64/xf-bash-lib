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

declare -a XF_PKG_CMDS_FEDORA=(
  "sudo dnf install -y"
  "sudo dnf update -y"
  "sudo dnf remove -y"
  "dnf search"
)

# }}}
# {{{ arch

declare -a XF_PKG_CMDS_ARCH=(
  "sudo pacman -S"
  "sudo pacman -Syyyuuu"
  "sudo pacman -R"
  "pacman -Q"
)

# }}}
# {{{ debian

declare -a XF_PKG_CMDS_DEBIAN=(
  "sudo apt install"
  "sudo apt update --refresh && apt upgrade"
  "sudo apt uninstall"
  "apt search"
)

# }}}
# {{{ termux

declare -a XF_PKG_CMDS_TERMUX=(
  "sudo pkg install -y"
  "sudo pkg update -y && pkg upgrade -y"
  "sudo pkg remove -y"
  "pkg search"
)

# }}}
# {{{ homebrew

declare -a XF_PKG_CMDS_HOMEBREW=(
  "sudo brew install -y"
  "sudo brew update"
  "sudo brew remove"
  "brew search"
)

# }}}
# {{{ compatibility check & definition

if xf_has_cmd "$XF_PKG_FEDORA_BIN"; then
  declare -a XF_PKG_CMDS=("${XF_PKG_CMDS_FEDORA[@]}")
elif xf_has_cmd "$XF_PKG_ARCH_BIN"; then
  declare -a XF_PKG_CMDS=("${XF_PKG_CMDS_ARCH[@]}")
elif xf_has_cmd "$XF_PKG_DEBIAN_BIN"; then
  declare -a XF_PKG_CMDS=("${XF_PKG_CMDS_DEBIAN[@]}")
elif xf_has_cmd "$XF_PKG_HOMEBREW_BIN"; then
  declare -a XF_PKG_CMDS=("${XF_PKG_CMDS_HOMEBREW[@]}")
elif xf_has_cmd "$XF_PKG_TERMUX_BIN"; then
  declare -a XF_PKG_CMDS=("${XF_PKG_CMDS_TERMUX[@]}")
else
  declare -a XF_PKG_CMDS=()
fi

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
# {{{ shortcuts

pkgi() {
  xf_pkg_install "$*"
}

pkgs() {
  xf_pkg_search "$*"
}

pkgu() {
  xf_pkg_update "$*"
}

pkgd() {
  xf_pkg_uninstall "$*"
}

pkgr() {
  xf_pkg_uninstall "$*"
}

# }}}
