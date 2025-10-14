#!/bin/bash
if [ ! -f Property_Tax_Roll.csv ]; then
    echo "Error: Property_Tax_Roll.csv not found. Please run wget to download it first."
    exit 1
fi
cat Property_Tax_Roll.csv \
  | grep "MADISON SCHOOLS" \
  | cut -d',' -f7 \
  | { 
      sum=0; count=0; 
      while read val; do
        if [[ "$val" =~ ^[0-9]+$ ]]; then
          sum=$((sum + val))
          count=$((count + 1))
        fi
      done
      if [ $count -gt 0 ]; then
        avg=$((sum / count))
        echo "Average TotalAssessedValue for MADISON SCHOOLS: $avg"
      else
        echo "No data found for MADISON SCHOOLS"
      fi
    }
