#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

echo "Package install currently supports Fedora only."
echo "If you already have the required tools installed, run the symlink step directly."

echo "Select your linux distro:"
select choice in "Fedora" "Cancel"; do
  case $choice in
    Fedora)
      echo "Selected distribution: Fedora"
      source "$SCRIPT_DIR/fedora.sh"
      break
      ;;
    Cancel)
      break
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
done
