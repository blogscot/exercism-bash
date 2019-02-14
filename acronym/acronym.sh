#!/usr/bin/env bash

function main() {
  text=$(echo $1 | tr '-' ' ')
  acronym=""
  
  for word in $text; do
    letter=${word:0:1}
    acronym+=${letter^^}
  done
  
  echo "$acronym"
}

main "$@"