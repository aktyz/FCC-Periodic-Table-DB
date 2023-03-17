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
