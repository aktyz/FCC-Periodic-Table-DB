#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PARSE_INFO() {
  echo $1 | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p on e.atomic_number=p.atomic_number INNER JOIN types t ON p.type_id=t.type_id WHERE e.atomic_number=$1")
  else
    ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements e INNER JOIN properties p on e.atomic_number=p.atomic_number INNER JOIN types t ON p.type_id=t.type_id WHERE e.symbol='$1' OR e.name='$1';")
  fi
  if [[ -z $ELEMENT_INFO ]]
  then
    echo -e "I could not find that element in the database."
  else
    PARSE_INFO $ELEMENT_INFO
  fi
fi
