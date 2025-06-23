# Normalization Steps

## 1. First Normal Form (1NF)
- All columns contain atomic values, with no repeating groups or multi-valued attributes.
- All tables in the schema already meet 1NF.

## 2. Second Normal Form (2NF)
- Each table is in 1NF.
- All non-key attributes are fully dependent on the primary key.
- The schema does not contain partial dependencies, so it is in 2NF.

## 3. Third Normal Form (3NF)
- Each table is in 2NF.
- There are no transitive dependencies between non-key attributes.
- The schema adheres to 3NF, ensuring that all attributes depend only on the primary key.

## Conclusion
The database schema is well-designed and already meets the requirements for 3NF. There are no redundancies or unnecessary dependencies.
