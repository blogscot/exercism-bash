#!/usr/bin/env bash

function isShouting() {
  local text="$1"
  if [ "$(echo $text | tr -d "[:alpha:]")" == "$text" ]; then
    echo false
    elif [ "${text^^}" == "$text" ]; then
    echo true
  else
    echo false
  fi
}

function isAsking() {
  noSpaces=$(echo $1 | tr -d "[:blank:]")
  if [ ${#noSpaces} -gt 0 ] && [ ${noSpaces: -1} == '?' ]; then
    echo true
  else
    echo false
  fi
}

function isSilent() {
  local text
  text=$(echo -e "$1" | tr -d '\n\t\r ' )
  
  if [ ${#text} == 0 ]; then
    echo true
  else
    echo false
  fi
}

function main() {
  local text=$1
  if [ $(isAsking "$text") == true ] && [ $(isShouting "$text") == true ]; then
    echo "Calm down, I know what I'm doing!"
    elif [ $(isAsking "$text") == true ]; then
    echo "Sure."
    elif [ $(isSilent "$text") ==  true ]; then
    echo "Fine. Be that way!"
    elif [ $(isShouting "$text") == true ]; then
    echo "Whoa, chill out!"
  else
    echo "Whatever."
  fi
}

main "$@"