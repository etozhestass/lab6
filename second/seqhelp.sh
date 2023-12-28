#!/bin/bash

for ((i = 1; i <= $2; i++)); do
  ./handler $1 $i
done
