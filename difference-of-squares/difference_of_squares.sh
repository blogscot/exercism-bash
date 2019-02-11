#!/usr/bin/env bash

set -o errexit
set -o nounset

function square_of_sum() {
  local limit=$1
  local sum=0
  local counter=1
  
  until [ "$counter" -eq $((limit+1)) ]; do
    sum=$((sum+counter))
    ((counter++))
  done
  
  echo $((sum*sum))
}

function sum_of_squares() {
  local limit=$1
  local sum=0
  local counter=1
  
  until [ "$counter" -eq $((limit+1)) ]; do
    sum=$((sum+counter*counter))
    ((counter++))
  done
  
  echo $sum
}

function difference() {
  local num=$1
  echo $(($(square_of_sum num) - $(sum_of_squares num)))
}

"$@"
