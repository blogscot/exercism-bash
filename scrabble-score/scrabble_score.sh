#!/usr/bin/env bash

function scoreLetter() {
  local letter=$1
  
  case ${letter,,} in
    a|e|i|o|u|l|n|r|s|t)
    echo 1;;
    d|g)
    echo 2;;
    b|c|m|p)
    echo 3;;
    f|h|v|w|y)
    echo 4;;
    k)
    echo 5;;
    j|x)
    echo 8;;
    q|z)
    echo 10;;
    *)
    echo 0;;
  esac
  
  
}

function main() {
  local word=$1
  local total=0
  
  for letter in $(echo $word | fold -w 1); do
    score=$(scoreLetter $letter)
    total=$(("total + score"))
  done
  
  echo $total
}

main "$@"


# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10