#!/usr/bin/env bash

set -o errexit
set -o nounset

function main() {
  num=$1
  total=0
  
  for (( i=0 ; i < ${#num} ; i++)); do
    digit=${num:i:1}
    ans=$(("$digit ** ${#num}"))
    total=$(("total + $ans"))
  done
  
  if test $total == $num; then
    echo true
  else
    echo false
  fi
}

main "$@"