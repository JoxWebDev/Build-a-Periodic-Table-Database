#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Define the data (you can replace this with a more dynamic way, like querying from a database or file)
elements=(
  "1,H,Hydrogen,1.008,-259.1,-252.9,nonmetal"
  "2,He,Helium,4.0026,-272.2,-268.9,nonmetal"
  "3,Li,Lithium,6.94,180.54,1342,metal"
  "4,Be,Beryllium,9.0122,1287,2970,metal"
  "5,B,Boron,10.81,2075,4000,metalloid"
  "6,C,Carbon,12.011,3550,4827,nonmetal"
  "7,N,Nitrogen,14.007,-209.9,-195.8,nonmetal"
  "8,O,Oxygen,15.999,-218.8,-182.9,nonmetal"
  "9,F,Fluorine,18.998,-220,-188.1,nonmetal"
  "10,Ne,Neon,20.18,-248.6,-246.1,nonmetal"
)

# Flag to track if element is found
element_found=false

# Function to find and display the element
find_element() {
  for element in "${elements[@]}"; do
    IFS=',' read -r atomic_number symbol name mass melting_point boiling_point type <<< "$element"
    
    # Check if the argument matches the atomic number, symbol, or name
    if [ "$1" == "$atomic_number" ] || [ "$1" == "$symbol" ] || [ "$1" == "$name" ]; then
      echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
      element_found=true
      break
    fi
  done
  
  # If element was not found, output the message
  if ! $element_found; then
    echo "I could not find that element in the database."
  fi
}

# Call the function to find and display the element
find_element "$1"
