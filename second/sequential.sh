#!/bin/bash

log=seq.log
sz=`cat .size`

g++ generator.cpp -o gen
g++ handler.cpp -o handler
if [[ -f $log ]]; then
  rm $log
fi
for ((n = 1; n <= 20; n++)); do
  echo "$n:" >> $log
  ./gen $n
  for ((it = 0; it < 10; it++)); do
    { \time -f "%E" ./seqhelp.sh $sz $n ; } 1>>.trash 2>>$log
  done
done
rm gen
rm handler
