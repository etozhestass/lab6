#!/bin/bash

for i in $(seq 1 $1); do ./sinh $i; done
wait
