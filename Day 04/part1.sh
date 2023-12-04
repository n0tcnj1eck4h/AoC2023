#!/bin/bash

while read line; do
  set1=`echo $line | awk -F'[:|]' '{print $2}' | xargs | tr -s ' ' '\n' | sort -n` 
  set2=`echo $line | awk -F'[:|]' '{print $3}' | xargs | tr -s ' ' '\n' | sort -n` 
  matches=`sort <(echo "$set1") <(echo "$set2") | uniq -d | wc -l`
  let "points=2**($matches)/2"
  let "sum+=points"
done && echo "$sum"
