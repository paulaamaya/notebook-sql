- [Introduction to Databases](#introduction-to-databases)
  - [Relational Schemas](#relational-schemas)
    - [Entity-Relationship Diagram](#entity-relationship-diagram)
    - [Schema Diagram](#schema-diagram)
    - [Keys](#keys)
- [SQL Theory](#sql-theory)
  - [Data Definition Language (DDL)](#data-definition-language-ddl)
  - [Data Manipulation Language (DML)](#data-manipulation-language-dml)
  - [Data Control Langauge (DCL)](#data-control-langauge-dcl)
  - [Transaction Control Language (TCL)](#transaction-control-language-tcl)

---

# Introduction to Databases

Structured Query Language (SQL) is a declarative programming language that allows you to create,manipulate, and share data specifically from Relational Database Systems (RDBMS).

**Database:** Systematic collection of data.  Their main goal id to organize large amounts of data that can be quickly retrieved. They must **compact, well-strucutred, and efficient**.
- The type of data contained in a field is pre-set in its creation
- Data is stored in table records, not individual cells
- All calculations and operations are done after data retrieval

**Database Management System (DBMS):** A collection of programs that enables users to access a database, munipulate data, and helps in the representation of data.  It also helps control access to the database by various users.

**Query:** Piece of code inducing the computer to execute a certain operation that will deliver the desired output.

**Entity:** The smallest unit that can contain a meaningful set of data. E.g. a row (record) in a table represents its horizontal entity and a column (field) its vertical entity.

## Relational Schemas

Database designers will plot the entire database system using two common methods.

### Entity-Relationship Diagram
![ER Diagram](images/er-diagram.png)

### Schema Diagram
![Relational Schema Diagram](images/relational-schema.png)

### Keys

**Primary Key:** A field (or set of fields) whose value exists and is unique for every record in a table.
- The PK is the **unique identifier of a table** .  A table can have at most one PK
- The PK field(s) cannot contain `null` values

**Foreign Key:** A field (or set of fields) in one table, that refers to the primary key in another table.  The table with the FK is called the child table, and the table with the PK is called the parent table.
- FK's identify relationships between tables
- Preserve data integrity (cannot enter a value in the FK field that has not been declared in the parent table)

**Unique Key:**  Unique keys ensure that all values in a fiels are different.  A PK automatically has a unique constraint on it.
- May contain `null` values
- A table may have multiple unique keys

---

# SQL Theory

SQL's syntax comprises several types of statements that allow you to perform various commands and operations.

## Data Definition Language (DDL)

Statements that allow us to define or modify data structures and objects (e.g. the `CREATE` statement).

```sql
-- create a table with a single column
CREATE TABLE sales_data (purchase_number INT);

-- add another column to it
ALTER TABLE sales_data
ADD COLUMN date_of_purchase DATE;

-- rename the table
RENAME TABLE sales_data TO sales;

-- delete the table
DROP TABLE sales;

-- alternatively, just empty the table
TRUNCATE TABLE sales;
```

## Data Manipulation Language (DML)

Statements that allow us to manipulate the data in a database (e.g. the `SELECT` statement is used to retrieve data from database objects).

```sql
-- retrieve entire table
SELECT * FROM sales;

-- insert data into table
-- equivalent to INSERT INTO sales (purchase_number, date_of_purchase) VALUES (001, '2021-10-11');
INSERT INTO sales VALUES (001, "2021-10-11");

UPDATE sales
SET date_of_purchase_ = "2020-12-12"
WHERE purchase = 1;
```

While the `TRUNCATE` statement removes all the records contained in the table, `DELETE` allows us to specify precisely what you would like removed.

```sql
DELETE FROM sales
WHERE purchase_number = 1;
```

## Data Control Langauge (DCL)

Statements that allow us to manage the rights users have in a database.  You can `GRANT` OR `REVOKE` priviledges to users.  Both of these keywords have identical syntax.

```sql
-- GRANT syntax
GRANT permission_type
ON database_name.table_name 
TO "username"@"localhost"

-- the user Frank can only SELECT 
-- and only from the customers table in the database
CREATE USER "frank"@"localhost" IDENTIFIED BY "password";
GRANT SELECT ON sales.customers TO "frank"@"localhost";
```

## Transaction Control Language (TCL)

Not every change you make to a database is saved automatically. 

The `COMMIT` statement will save the changes you've made, allowing other users to access the modified version.  It only works with changes related to the DML keywords `INSERT`, `DELETE`, and `UPDATE`.

```sql
UPDATE customers
SET last_name = "Johnson"
WHERE custumer_id = 4
COMMIT;
```

Comitted statements cannot be udone.  However, the `ROLLBACK` clause reverts all changes since the last commit or rollback.
