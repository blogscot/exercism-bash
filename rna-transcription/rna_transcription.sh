#!/usr/bin/env bash

set -o errexit
set -o nounset

function main() {
  
  if [ $# -ne 1 ]
  then
    echo ""
    exit 0
  fi
  
  declare -A trans
  trans[G]='C'
  trans[C]='G'
  trans[T]='A'
  trans[A]='U'
  
  seq=$1
  complement=""
  
  for (( i=0 ; i < ${#seq} ; i++ )); do
    letter="${seq:i:1}"
    
    if test "${trans[$letter]+isset}"; then
      comp="${trans[$letter]}"
      complement="$complement$comp"
    else
      echo 'Invalid nucleotide detected.'
      exit 1
    fi
  done
  
  echo "$complement"
}

main "$@"