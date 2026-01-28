#!/bin/bash
# cars.sh
# Jake Jameson
# CPSC 298

inventory_file="my_old_cars"

# Ensure the inventory file exists
touch "$inventory_file"

while true; do
  echo "=============================="
  echo "Old Cars Inventory Menu"
  echo "1) Add a car"
  echo "2) List cars"
  echo "3) Quit"
  echo "=============================="
  printf "Enter your choice (1-3): "
  read -r choice

  case "$choice" in
    1)
      printf "Enter Year: "
      read -r year
      printf "Enter Make: "
      read -r make
      printf "Enter Model: "
      read -r model

      # Append as colon-separated record: Year:Make:Model
      printf "%s:%s:%s\n" "$year" "$make" "$model" >>"$inventory_file"
      echo "Car added."
      ;;
    2)
      echo "Cars in inventory (sorted by year):"
      if [[ -s "$inventory_file" ]]; then
        sort -t: -k1,1n "$inventory_file"
      else
        echo "(No cars in inventory yet.)"
      fi
      ;;
    3)
      echo "Goodbye"
      break
      ;;
    *)
      echo "Invalid choice. Please enter 1, 2, or 3."
      ;;
  esac
done
