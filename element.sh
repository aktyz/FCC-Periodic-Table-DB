#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]] # is the argument a number?
  then
    ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p on e.atomic_number=p.atomic_number INNER JOIN types t ON p.type_id=t.type_id WHERE e.atomic_number=$1")
  else # it's a string, so query using symbol and name db columns
    ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p on e.atomic_number=p.atomic_number INNER JOIN types t ON p.type_id=t.type_id WHERE e.symbol='$1' OR e.name='$1';")
  fi
  if [[ -z $ELEMENT_INFO ]]
  then
    echo -e "I could not find that element in the database."
  else
    echo $ELEMENT_INFO
  fi
fi
