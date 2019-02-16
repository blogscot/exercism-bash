#!/usr/bin/env bash

function main() {
  
  local nonDigits=$(echo $1 | tr -d "[:digit:][:space:]")
  if test ! -z $nonDigits; then
    echo false
    exit 0
  fi
  
  local num=$(echo $1 | tr -cd "[:digit:]" | rev)
  if test ${#num} -lt 2; then
    echo false
    exit 0
  fi
  
  declare -i total=0
  declare -i value
  for (( i=0 ; i < ${#num} ; i++ )) do
    local digit=${num:i:1}
    if test $((i%2)) -eq 1; then
      value=$((digit*2))
      if test $value -gt 9; then
        value=$((value-9))
      fi
      total=$((total+value))
    else
      total=$((total+digit))
    fi
  done
  
  if test $((total%10)) -eq 0; then
    echo true
  else
    echo false
  fi
}

main "$@"