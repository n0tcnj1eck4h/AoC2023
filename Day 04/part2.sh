#!/bin/bash

while read line; do
  let "n++"
  let "line$n++"
  set1=`echo $line | awk -F'[:|]' '{print $2}' | xargs | tr -s ' ' '\n' | sort -n` 
  set2=`echo $line | awk -F'[:|]' '{print $3}' | xargs | tr -s ' ' '\n' | sort -n` 
  matches=`sort <(echo "$set1") <(echo "$set2") | uniq -d | wc -l`
  for i in $(seq 1 $matches); do
    let "line$(($n+$i))+=line$n"
  done
  let "sum+=line$n"
done && echo "$sum"
