#!/bin/bash

# Function to read a CSV file and handle different delimiters and quote styles
read_csv_file() {
    local filename="$1"
    local delimiter="$2"

    # Check file exists
    if [[ ! -e "$filename" ]]; 
    then
        echo "Error: File does not exist."
        return 1
    fi


    # Default to comma if no delimiter provided
    if [[ -z "$delimiter" ]]; then
        delimiter=","
    fi

    # Read and parse each line from the CSV file
    awk -F"$delimiter" -v dq='"' '
    {
        for (i = 1; i <= NF; i++) {
            gsub(dq, "", $i); # Remove double quotes if they exist
        }
        # Process the line (for demonstration, print the fields)
        for (i = 1; i <= NF; i++) {
            printf "Field %d: %s\n", i, $i;
        }
        print "----";
    }
    ' "$filename"
}

# Example usage:
# read_csv_file "example.csv" ","
