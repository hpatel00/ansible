#!/bin/bash

C1=$(git tag -l | awk -F . '{ print $1 }' | sort -n | uniq | tail -1)
git tag -l | grep "^${C1}" >/tmp/sort1

C2=$(cat /tmp/sort1 | awk -F . '{ print $2 }' | sort -n | uniq | tail -1)
cat /tmp/sort1 | grep "^${C1}\.${C2}.*" >/tmp/sort2

C3=$(cat /tmp/sort2 | awk -F . '{ print $3 }' | sort -n | uniq | tail -1)
C3=$((C3+1))
echo "${C1}.${C2}.${C3}"
