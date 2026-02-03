#!/bin/bash

filesdir="${1:-}"
searchstr="${2:-}"

if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
   echo "params number error"
   exit 1
fi

if [ ! -d "$filesdir" ]; then
   echo "param1 is not a files directory"
   exit 1
fi

filecount="$(
 grep -rIl -- "$searchstr" "$filesdir" | wc -l 
)"

strcount="$(
 grep -rI -- "$searchstr" "$filesdir" | wc -l
)"

echo "The number of files are $filecount and the number of matching lines are $strcount"
