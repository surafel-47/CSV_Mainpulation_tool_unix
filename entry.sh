#!/bin/bash

source Src/IO.sh
source Src/BasicAnalyis.sh
source Src/StatAnalyis.sh
source Src/FilterSort.sh
source GUI/GUI.sh
source main.sh

# Ask the user how they would like to proceed
echo "Would you like to use the (C)ommand-line interface or the (G)UI?"
read choice

case $choice in
  [Cc])
    main
    ;;
  [Gg])
    launch_menu
    ;;
  *)
    echo "Invalid option."
    exit 1
    ;;
esac
