#!/usr/bin/env bash

function isAnagram() {
  word1="$1"
  word2="$2"
  
  if [ "${#word1}" -ne "${#word2}" ] || [ "$word1" == "$word2" ]; then
    echo false
  fi
  
  l1=$(echo "$word1" | fold -w 1 | sort | uniq -c)
  l2=$(echo "$word2" | fold -w 1 | sort | uniq -c)
  
  if [ "$l1" == "$l2" ]
  then
    echo true
  else
    echo false
  fi
}

function main() {
  if [ $# -ne 2 ]; then
    exit 1
  fi
  
  match="$1"
  items="$2"
  matches=()
  
  for item in $items; do
    if [ "$(isAnagram "${match,,}" "${item,,}")" == true ]; then
      matches+=("$item")
    fi
  done
  
  echo "${matches[@]}"
}

main "$@"
