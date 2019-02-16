#!/usr/bin/env bash

function main() {
  local square=$1
  [ $square -lt 1 ] || [ $square -gt 64 ] && {
    echo "Error: invalid input"
    exit 1
  }
  
  printf "%u\n" $((1<<$((square-1))))
}

function total() {
  declare -i sum=0
  for num in {1..64}; do
    sum+=$(main "$num")
  done
  printf "%u\n" $sum
}

if test $1 = "total"; then
  echo $(total)
else
  main "$@"
fi
