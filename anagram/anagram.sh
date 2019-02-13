#!/usr/bin/env bash

function isAnagram() {
  word1="$1"
  word2="$2"
  
  if [ "${#word1}" -ne "${#word2}" ] || [ "$word1" == "$word2" ]; then
    echo false
  fi
  
  u1=$(echo "$word1" | fold -w 1 | sort | uniq -c)
  u2=$(echo "$word2" | fold -w 1 | sort | uniq -c)
  
  if [ "$u1" == "$u2" ]
  then
    echo true
  else
    echo false
  fi
}

function main() {
  if [ $# -ne 2 ]; then
    echo "Usage: bash anagram.sh <word> <wordlist>"
    exit 1
  fi
  
  match="$1"
  items="$2"
  matches=()
  
  for item in $items; do
    # check lowercase items
    if [ "$(isAnagram "${match,,}" "${item,,}")" == true ]; then
      matches+=("$item")
    fi
  done
  
  echo "${matches[@]}"
}

main "$@"
