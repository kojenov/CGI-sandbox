#!/bin/bash

printf "Content-type: text/html\n\n"
echo "<pre>"

echo "Number of command line arguments: $#"
let i=0
for arg in "$@"; do
  echo "$i: '$arg'"
  let i=i+1
done

echo
echo "Environment variables:"
env | sort

echo "</pre>"
