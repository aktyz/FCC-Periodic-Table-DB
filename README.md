# FCC-Periodic-Table-DB
One of the projects to complete [FreeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-database/)

## [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
Functions used in this project:
```sql
UPDATE elements SET symbol=INITCAP(symbol) WHERE atomic_number < 10;
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL;
SELECT
  e.atomic_number,
  e.symbol,
  e.name,
  p.atomic_mass,
  p.melting_point_celsius,
  p.boiling_point_celsius,
  t.type
FROM elements e
  INNER JOIN properties p
    ON e.atomic_number=p.atomic_number
  INNER JOIN types t
    ON p.type_id=t.type_id;
```

## What is still left to do:
- If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```sh
"It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
```

- If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.
