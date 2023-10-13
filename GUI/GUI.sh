#!/bin/bash
source ../Src/IO.sh
source ../Src/BasicAnalyis.sh
source ../Src/StatAnalyis.sh
source ../Src/FilterSort.sh


# Function to launch the GUI menu
launch_menu() {
  
    choice=$(dialog --clear \
                    --backtitle "CSV Analysis Tool" \
                    --title "Main Menu" \
                    --menu "Choose an operation:" 15 50 9 \
                    "1" "Display the number of rows and columns" \
                    "2" "List unique values in a specified column" \
                    "3" "Display column names (header)" \
                    "4" "Minimum and maximum values for numeric columns" \
                    "5" "Most frequent value for categorical columns" \
                    "6" "Summary statistics for numeric columns" \
                    "7" "Filter and extract rows and columns" \
                    "8" "Sort the CSV file based on a column" \
                    "q" "Quit" 2>&1 >/dev/tty)

    clear
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

# Start the GUI
launch_menu
