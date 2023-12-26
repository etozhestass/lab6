#!/bin/bash

name=sinh
log=2.log

g++ sinh.cpp -o $name
if [[ -f $log ]]; then
  rm $log
fi
for ((n = 1; n <= 20; n++)); do
  echo "$n:" >> $log
  for ((it = 0; it < 10; it++)); do
    { \time -f "%E" ./a2.sh $n ; } 1>>.trash 2>>$log
  done
done
rm $name
