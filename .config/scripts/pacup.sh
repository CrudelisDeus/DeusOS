#!/bin/bash

# pacup — helper function for managing Arch Linux updates
#
# Usage:
#   pacup fast   — quick update (no mirror refresh)
#   pacup full   — full update (refresh mirrors + update system)
#   pacup clean  — clean package cache
#
# Modes:
#   fast  — runs `pacman -Syu` (standard system update)
#   full  — refreshes mirror list using reflector,
#           then runs `pacman -Syyu` (force refresh package databases)
#   clean — removes cached packages (`pacman -Scc`)
#
# Requirements:
#   - reflector must be installed
#   - this file must be sourced in ~/.bashrc
#     or executed before using the function
#
# Example:
#   pacup full

pacup() {
  case "$1" in
    fast)
      echo "Fast update (no mirrors)"
      sudo pacman -Syu
      ;;
    full)
      echo "Full update with mirrors"
      sudo reflector --latest 20 --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
      sudo pacman -Syyu
      ;;
    clean)
      echo "Cleaning cache"
      sudo pacman -Scc
      ;;
    *)
      echo "Usage: pacup [fast|full|clean]"
      ;;
  esac
}
