#!/usr/bin/env bash

function main() {
  local numLetters=$(echo ${1,,} | tr -cd "[:alpha:]" | fold -w 1 | sort -u | wc -l)
  
  if [ $numLetters == 26 ]; then
    echo true
  else
    echo false
  fi
}

main "$@"