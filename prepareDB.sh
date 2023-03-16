#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo -e "\n~~ Let me get the DB ready ~~\n"
$($PSQL "DROP TABLE properties, types, elements CASCADE;")

echo -e "Current list of relations in periodic_table DB:\n"
DB_RELATIONS=$($PSQL "\d")
echo $DB_RELATIONS
# if [[ $DB_RELATIONS = *"Did not find any relations."* ]] <- this doens't work for some reason
# then
  echo -e "\nLoading the periodic_table.sql"
  psql -U postgres < periodic_table.sql
  DB_RELATIONS=$($PSQL "\d")
  echo $DB_RELATIONS
# fi
