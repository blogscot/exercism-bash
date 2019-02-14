#!/usr/bin/env bash

set -o errexit
set -o nounset

function main() {
  local name="${1:-you}"
  echo "One for $name, one for me."
}

main "$@"
