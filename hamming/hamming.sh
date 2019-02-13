#!/usr/bin/env bash

# Why does errexit break this code but not other code examples?
# set -o errexit
set -o nounset

function main() {
  if [ $# -ne 2 ]; then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
  fi
  local strand1=$1
  local strand2=$2
  if [ ${#strand1} -ne ${#strand2} ]; then
    echo "left and right strands must be of equal length"
    exit 1
  fi
  
  local counter=0
  
  for (( i=0 ; i < ${#strand1} ; i++ )); do
    if [ "${strand1:i:1}" != "${strand2:i:1}" ]; then
      ((counter++))
    fi
  done
  
  echo "$counter"
}

main "$@"