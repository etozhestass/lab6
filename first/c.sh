#!/bin/bash

name=sinh
log=1.log

g++ sinh.cpp -o $name
[[ -f $log ]] && rm $log
for n in {1..20}; do
  echo "$n:" >> $log
  for it in {0..9}; do
    { \time -f "%E" ./b.sh $n; } 1>>.trash 2>>$log
  done
done
rm $name

