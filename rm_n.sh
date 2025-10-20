#!/bin/bash
# rm_n.sh — remove all files in a directory larger than n bytes
# usage: ./rm_n.sh <dir> <n>

if [ $# -ne 2 ]; then
  echo "usage: $0 <dir> <n>" 1>&2
  exit 1
fi

dir=$1
n=$2

if [ ! -d "$dir" ]; then
  echo "Error: Directory '$dir' not found." 1>&2
  exit 1
fi

find "$dir" -type f -size +${n}c -exec rm {} \;

echo "All files larger than $n bytes in '$dir' have been removed."
