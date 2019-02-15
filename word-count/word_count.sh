#!/usr/bin/env bash

function main() {
  
  local text=$(echo -e "$1" | tr -d '!&@$%^\:\n.' | tr ',' ' ')
  
  declare -A uniqWords
  
  readarray -d ' ' words < <(echo "${text,,}")
  
  for word in ${words[@]}; do
    
    word=${word#"'"}
    word=${word%"'"}
    
    if [[ ${uniqWords[$word]} ]]; then
      ((uniqWords['${word}']++))
    else
      uniqWords[$word]=1
    fi
  done
  
  for key in ${!uniqWords[@]}; do
    echo "$key: ${uniqWords[$key]}"
  done
  
}

main "$@"
