#!/usr/bin/env bash

function main() {
  local text=$(echo $1 | tr '-' ' ')
  local acronym=""
  
  for word in $text; do
    local letter=${word:0:1}
    acronym+=${letter^^}
  done
  
  echo "$acronym"
}

main "$@"