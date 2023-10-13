#!/bin/bash

# Function to find the minimum value in a specified column
find_min_max_value() {
    local csv_file=$1
    local column_number=$2

    awk -F ',' -v col=$column_number 'NR > 1 {if (min == "" || $col < min) min=$col} END {print min}' "$csv_file"
    
      awk -F ',' -v col=$column_number 'NR > 1 {if (max == "" || $col > max) max=$col} END {print max}' "$csv_file"
    
}

# Function to find the most frequent value in a specified column
find_most_frequent_value() {
    local csv_file=$1
    local column_number=$2
    
    most_frequent_value=$(awk -F ',' -v col=$column_number 'NR > 1 {freq[$col]++} END {for (i in freq) {if (max_freq < freq[i]) {max_freq = freq[i]; most_frequent = i}} print most_frequent}' "$csv_file")
    
    echo "Most frequent value in column $column_number: $most_frequent_value"
}



# File: summary_stats.sh

# Function to find the median value of a specified column
find_median_value() {
    local csv_file=$1
    local column_number=$2

    # Sort the column and find the median
    local median_value=$(awk -F ',' -v col=$column_number 'NR > 1 {print $col}' "$csv_file" | sort -n | awk '{
        a[NR] = $1
    } END {
        if (NR % 2 == 1) {
            print a[int(NR/2) + 1]
        } else {
            print (a[NR/2] + a[NR/2+1]) / 2
        }
    }')

    echo "Median value in column $column_number: $median_value"
}

# Function to find the mean value of a specified column
find_mean_value() {
    local csv_file=$1
    local column_number=$2

    awk -F ',' -v col=$column_number 'NR > 1 {sum += $col; count++} END {if (count > 0) print sum / count}' "$csv_file"
}

# Function to find the standard deviation of a specified column
find_std_dev() {
    local csv_file=$1
    local column_number=$2
    local mean=$(find_mean_value "$csv_file" "$column_number")
       echo "Mean value in column $column_number: $mean"

    local std_dev=$(awk -F ',' -v col=$column_number -v mean=$mean 'NR > 1 {sum += ($col - mean)^2; count++} END {if (count > 0) print sqrt(sum / count)}' "$csv_file")

    echo "Standard Deviation in column $column_number: $std_dev"
}

# Main summary function that calls the other statistical functions
summary_stats() {
    local csv_file=$1
    local column_number=$2

    echo "Statistics for column $column_number in file $csv_file:"
    
    find_median_value "$csv_file" "$column_number"
    find_std_dev "$csv_file" "$column_number"
}


# Uncomment and modify the lines below to test these functions:
# csv_file="./your_file.csv"
# find_min_value "$csv_file" 2
# find_max_value "$csv_file" 2
# find_mean_value "$csv_file" 2
# find_std_dev "$csv_file" 2
