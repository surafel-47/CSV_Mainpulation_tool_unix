#!/bin/bash

# Function to count the number of rows and columns in the CSV file
display_num_rows_columns() {
    local csv_file=$1
    if [[ ! -f $csv_file ]]; then
        echo "File not found."
        return 1
    fi
    
    local num_rows=$(wc -l < "$csv_file")
    local num_columns=$(head -n 1 "$csv_file" | awk -F ',' '{print NF}')
    
    echo "Number of Rows: $num_rows"
    echo "Number of Columns: $num_columns"
}

# Function to list unique values in a specified column
list_unique_values() {
    local csv_file=$1
    local column_number=$2
    
    if [[ ! -f $csv_file ]]; then
        echo "File not found."
        return 1
    fi
    
    if [[ -z "$column_number" ]]; then
        echo "No column number provided."
        return 1
    fi
    
    awk -v col=$column_number -F ',' 'NR > 1 {print $col}' "$csv_file" | sort | uniq
}

# For testing purposes, uncomment and modify these lines
# csv_file="./your_file.csv"
# display_num_rows_columns "$csv_file"
# list_unique_values "$csv_file" 2
