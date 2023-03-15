# FCC-Periodic-Table-DB
One of the projects to complete [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/)

## [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
Functions used in this project:
```sql
UPDATE elements SET symbol=INITCAP(symbol) WHERE atomic_number < 10;
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL;
```

## What is still left to do:
- If you run ./element.sh, it should output only Please provide an element as an argument. and finish running.

- If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

- If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.

- If the argument input to your element.sh script doesn't exist as an atomic_number, symbol, or name in the database, the only output should be I could not find that element in the database.
