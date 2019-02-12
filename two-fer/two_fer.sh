#!/usr/bin/env bash

set -o errexit
set -o nounset

function main() {
  local name
  if [ $# -eq 0 ]; then
    name='you'
  else
    name=$1
  fi
  echo "One for $name, one for me."
}

main "$@"
