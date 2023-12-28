#!/bin/bash

function remove_l0() {
  num=$1
  num=${num#0}
  if [[ -z $num ]]; then
    echo 0
  else
    echo $num
  fi
}

function to_ms() {
  m=$(remove_l0 `cut -d ':' -f 1 <<< $1`)
  s=$(remove_l0 `cut -d ':' -f 2 <<< $1 | cut -d '.' -f 1`)
  ms=$(remove_l0 `cut -d '.' -f 2 <<< $1 | cut -d '0' -f 2`)
  echo $((100*(60*m+s)+ms))
}

if [[ $# -ne 1 ]]; then
  echo "Illegal count of arguments error"
  echo "Usage: $0 <file>"
  exit 1
fi
if [[ ! -f $1 ]]; then
  echo "File not found error"
  exit 2
fi
echo "N Time"
for ((it = 1; it <= 20; it++)); do
  sum=0
  read
  for ((i = 0; i < 5; i++)); do
    read line
    ms=$(to_ms $line)
    let sum=$sum+$ms
  done
  echo $it $sum
done < $1
