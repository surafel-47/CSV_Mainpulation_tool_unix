#!/bin/bash

# Source other scripts
source Src/IO.sh
source Src/BasicAnalyis.sh
source Src/StatAnalyis.sh
source Src/FilterSort.sh

# Main function
main() {
  while true; do
    echo "CSV Analysis Tool"
    echo "================="
    echo "1. Display the number of rows and columns"
    echo "2. List unique values in a specified column"
    echo "3. Display column names (header)"
    echo "4. Minimum and maximum values for numeric columns"
    echo "5. Most frequent value for categorical columns"
    echo "6. Summary statistics for numeric columns"
    echo "7. Filter and extract rows and columns"
    echo "8. Sort the CSV file based on a column"
    echo "q. Quit"
    echo -n "Select an option: "
    read choice

    case $choice in
      1)
        display_num_rows_columns "world.csv"
        ;;
      2)
        echo -n "Enter the column number: "
        read col
        list_unique_values "world.csv" $col 
        ;;
      3)
        #display_headers
        ;;
      4)
      echo -n "Enter the column number: "
        read col
        find_min_max_value "world.csv" $col
        ;;
      5)
    echo -n "Enter the column number for finding the most frequent value: "
    read col
    find_most_frequent_value "world.csv" $col
    ;;  6)
      echo -n "Enter the column number for finding the most frequent value: "
    read col
       summary_stats  "world.csv" $col
        ;;
     7)
        echo -n "Enter the column number for filtering: "
        read col
        filter_extract "world.csv" $col
        ;;
      8)
        echo -n "Enter the column number for sorting: "
        read col
        sort_csv "world.csv" $col
        ;;
      q|Q)
        exit 0
        ;;
      *)
        echo "Invalid option."
        ;;
    esac
    echo "Press any key to continue..."
    read -n 1 -s
    clear
  done
}

# Call main function
main
