#!/usr/bin/env bash

function main() {
  local output=""
  
  [ $(($1 % 3)) == 0 ] && output="Pling"
  [ $(($1 % 5)) == 0 ] && output="${output}Plang"
  [ $(($1 % 7)) == 0 ] && output="${output}Plong"
  [ -z $output ] && output=$1
  
  echo "$output"
}


main "$@"