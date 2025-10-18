#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "usage: $0 <column> [file.csv]" >&2
  exit 1
fi
col="$1"

if [ $# -ge 2 ]; then
  input="$2"
else
  input="/dev/stdin"
fi

mean=$(
  tail -n +2 "$input" \
  | cut -d',' -f "$col" \
  | awk 'NF && $0 != "" { s += $1; n += 1 } END { if (n>0) printf "%.6f\n", s/n; else print "NA" }'
)

echo "$mean"
