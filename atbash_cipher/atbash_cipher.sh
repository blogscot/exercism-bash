#!/usr/bin/env bash

function encode() {
  echo $(echo ${1,,} | tr -d "[:space:][:punct:]" | tr [a-z] [zyxwvutsrqponmlkjihgfedcba] | fold -w 5)
}

function decode() {
  echo $1 | tr -d "[:space:]" | tr [zyxwvutsrqponmlkjihgfedcba] [a-z]
}

"$@"