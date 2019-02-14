#!/usr/bin/env bash

function main() {
  
  [ $# -ne 1 ] && {
    echo "Usage: ./error_handling <greetee>"
    exit 1
  }
  
  echo "Hello, $1"
}

main "$@"