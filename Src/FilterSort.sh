#!/bin/bash

filter_extract() {
    local csv_file=$1
   local column_number=$2
    echo "Enter the condition (e.g., >10, <=42, ==5): "
    read condition
    awk -F ',' -v col=$column_number "NR==1 || \$col $condition" $csv_file > filtered.csv
    echo "Filtered data saved to 'filtered.csv'"
}

sort_csv() {
    local csv_file=$1
  local column_number=$2
    # Exclude the header, sort the data, then prepend the header
    (head -n 1 $csv_file && tail -n +2 $csv_file | sort -t ',' -k $column_number -n) > sorted.csv
    echo "Sorted data saved to 'sorted.csv'"
}
