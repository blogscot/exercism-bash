#!/usr/bin/env bash

function main() {
  by3=$(($1 % 3))
  by5=$(($1 % 5))
  by7=$(($1 % 7))
  output=""
  
  if [ $by3 == 0 ]; then
    output="Pling"
  fi
  if [ $by5 == 0 ]; then
    output="${output}Plang"
  fi
  if [ $by7 == 0 ]; then
    output="${output}Plong"
  fi
  if [ -z $output ]; then
    output=$1
  fi
  
  echo "$output"
}


main "$@"