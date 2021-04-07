- [Introduction to Databases](#introduction-to-databases)
  - [Tables](#tables)
    - [Field Constraints](#field-constraints)
  - [Data Types](#data-types)
  - [Relational Schemas](#relational-schemas)
    - [Entity-Relationship Diagram](#entity-relationship-diagram)
    - [Schema Diagram](#schema-diagram)
    - [Keys](#keys)
- [SQL Theory](#sql-theory)
  - [Data Definition Language (DDL)](#data-definition-language-ddl)
  - [Data Manipulation Language (DML)](#data-manipulation-language-dml)
  - [Data Control Langauge (DCL)](#data-control-langauge-dcl)
  - [Transaction Control Language (TCL)](#transaction-control-language-tcl)
- [DDL](#data-definition)
  - [Creating Tables](#creating-tables)
  - [Modifying Columns](#modifying-columns)
- [DML](#data-manipulation)
  - [Inserting Data](#inserting-data)
  - [Updating Data](#updating-data)
  - [Deleting Data](#deleting-data)
- [Queries](#queries)
  - [Odering Results](#ordering-results)
  - [Limiting Queries](#limiting-queries)

---

# Introduction to Databases

Structured Query Language (SQL) is a declarative programming language that allows you to create,manipulate, and share data specifically from Relational Database Management Systems (RDBMS).

**Database:** Systematic collection of data.  Their main goal is to organize large amounts of data that can be quickly retrieved. They must **compact, well-structured, and efficient**.

- Data is stored in table records, not individual cells.
- All calculations and operations are done after data retrieval.

**Database Management System (DBMS):** A collection of programs that enables users to access a database, munipulate data, and helps in the representation of data.  It also helps control access to the database by various users.

**Query:** Piece of code inducing the computer to execute a certain operation that will deliver the desired output.

**Entity:** The smallest unit that can contain a meaningful set of data. E.g. a row (record) in a table represents its horizontal entity and a column (field) its vertical entity.

## Tables

Contain **fields** (columns) and **records** (rows) of data.

- Each field has a defined data type.
- Each field should contain only one value per record.
- Each row of sata should be unique.

### Field Constraints

1. **Unique:** Ensures that a field can only contain unique values.  Throws an error if a field contains duplicate values.
2. **Not Null:** Ensures that  a field cannot constain `NULL` values.
3. **Check:**  Ensures that data in a field satiisfies a specific `BOOLEAN` expression.

## Data Types

See here for a full list of [PostgeSQL data types](https://www.postgresql.org/docs/13/datatype.html).  The most common ones can be found below.

| Type | Description | Examples |
|-|-|-|
| `INT` | Whole number | Age, quantity |
| `NUMERIC(P,S)` | Arbitrary-precision numbers with P significant digits and S decimal places. | Height, price |
| `SERIAL` | Auto-incrementing integers | Not true types, merely notational convenience for creating unique id columns |
| `CHAR(N)` | Fixed length string of length N | Gender, state |
| `VARCHAR(N)` | Varying length string of max length N | Name, email |
| `TEXT` | Varying length string with no max length | Comments, reviews |
| `TIME` | HH:MM:SS | In military format |
| `DATE` | YYYY-MM-DD |  |
| `TIMESTAMP` | YYYY-MM-DD HH:MM:SS | Order time |
| `BOOLEAN` | True or false | In stock |
| `ENUM` | Values belonging to a user-defined list | Day of the week |

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
CREATE TABLE SALES_DATA(purchase_number INT);

-- add another column to it
ALTER TABLE sales_data
ADD COLUMN date_of_purchase DATE;

-- rename the table
rename TABLE sales_data TO sales;

-- delete the table
DROP TABLE sales;

-- alternatively, just empty the table
TRUNCATE TABLE sales;
```

## Data Manipulation Language (DML)

Statements that allow us to manipulate the data in a database (e.g. the `SELECT` statement is used to retrieve data from database objects).

```sql
-- retrieve entire table
SELECT *
FROM sales;

-- insert data into table
-- equivalent to INSERT INTO sales (purchase_number, date_of_purchase) VALUES (001, '2021-10-11');
INSERT INTO sales
VALUES ( 001, "2021-10-11" );
UPDATE sales
SET date_of_purchase_ = "2020-12-12"
WHERE purchase = 1;
```

While the `TRUNCATE` statement removes all the records contained in the table, `DELETE` allows us to specify precisely what you would like removed.

```sql
DELETE FROM sales
WHERE purchase_number = 1;
```

## Data Control Language (DCL)

Statements that allow us to manage the rights users have in a database.  You can `GRANT` OR `REVOKE` priviledges to users.  Both of these keywords have identical syntax.

```sql
-- GRANT syntax
GRANT permission_type ON database_name.table_name 
TO "username" @ "localhost"

-- the user Frank can only SELECT
-- and only from the customers table in the database
CREATE USER "frank" @ "localhost" identified BY "password";

GRANT SELECT ON sales.customers 
TO "frank" @ "localhost";
```

## Transaction Control Language (TCL)

The `COMMIT` statement will save the changes you've made, allowing other users to access the modified version.  It only works with changes related to the DML keywords `INSERT`, `DELETE`, and `UPDATE`.

```sql
UPDATE customers
SET last_name = "Johnson"
WHERE custumer_id = 4 COMMIT;
```

Comitted statements cannot be udone.  However, the `ROLLBACK` clause reverts all changes since the last commit or rollback.

---

# DDL

To connect to your local database using from the command line, use the command `psql -U postgres -h localhost database_name`.  To connect to a specific database while already in psql, simply use the meta command `\c database_name`.

To create a new database use the following command:

```sql
CREATE DATABASE database_name;
```

## Creating Tables

```sql
-- Parent table
CREATE TABLE DIRECTORS( director_id serial PRIMARY KEY,
                        first_name VARCHAR ( 30 ),
                        last_name VARCHAR ( 30 ) NOT NULL,
                        date_of_birth DATE,
                        nationality VARCHAR ( 20 ) );

-- Child table
CREATE TABLE MOVIES( movie_id serial PRIMARY KEY,
                     movie_name VARCHAR ( 50 ) NOT NULL,
                     movie_length INT,
                     release_date DATE,
                     -- FOREIGN KEY field
                     director_id INT REFERENCES DIRECTORS(director_id) );
```

A **junction table** maps two or more tables together by referencing the PK's of each data table. It contains a number of foreign keys, each in a many-to-one relationship from the junction table to the individual data tables. The PK of the junction table is typically composed of the FK columns themselves.

```sql
CREATE TABLE MOVIES_ACTORS( movie_id INT REFERENCES MOVIES(movie_id),
                            actor_id INT REFERENCES ACTORS(actor_id),
                            PRIMARY KEY ( movie_id, actor_id ) );
```

## Modifying Columns

To add a column we use the `ALTER` statement to add a column.  As always we have to define the field's data type and contatraints at the time of creation.

```sql
ALTER TABLE directors
ADD COLUMN email VARCHAR ( 50 ) UNIQUE,
ADD COLUMN age INT NOT NULL;
```

To modify a field's data type, you use the `ALTER` keyword both on the table and the column along with the  `TYPE` keyword.

```sql
ALTER TABLE directors
ALTER COLUMN nationality type CHAR ( 3 ),
ALTER COLUMN last_name type VARCHAR ( 50 );
```

Adding constraints on a field after its creation is a little bit more tricky and should be avoided through appropiate design.  For more information on how to do it [see here](https://www.cockroachlabs.com/docs/stable/add-constraint.html).

# DML

## Inserting Data

To insert records into a table, follow the following template:

```sql
INSERT INTO TABLENAME(colname1, colname2, ...)
VALUES ( value1, value2, ... );
```

If you are adding a value to every column in the table you can use shoerthand notation by omitting the column names in the query above.  However, keep in mind that while we don't insert values into  `SERIAL` columns, they are still a column in the table so we do have to specify that we are only adding values to all the other columns only and cannot use the shorthand notation.

```sql
-- the first col in this table is the id which is a serial
-- the query specifies the values are going to all other columns
INSERT INTO OWNERS(first_name, last_name, city, province)
VALUES ( 'Paula', 'Amaya', 'Toronto', 'ON' ),
       ( 'Claudia', 'Amaya', 'Toronto', 'ON' ),
       ( 'Bob', 'Smith', 'Vancouver', 'BC' ),
       ( 'Fanny', 'Lu', 'Montreal', 'QC' );
```

## Updating Data

To update data in a table, follow the following template:

```sql
UPDATE tablename
SET colname = newvalue
WHERE colname = somevalue;
```

When targeting a specific record, it's usually a good idea to use the PK as the `WHERE` clause because you know that is a unique entry in the record.

```sql
UPDATE owners
SET city = 'Leduc',
    province = 'AB'
WHERE id = 2;
```

## Deleting Data

To update data in a table, follow the following template:

```sql
DELETE FROM tablename
WHERE colname = somevalue;
```

As with all other manipulation queries, you can maniipulate multiple records at a time.

```sql
-- remove all Oakville records
DELETE FROM owners
WHERE city = 'Oakville';
```

# Queries

We can retrieve entire columns, and these are simplest queries we can make:

```sql
SELECT * FROM actors;

SELECT first_name,
       last_name
FROM actors;
```

We can use a `WHERE` clause to filter the results of a query even further:

```sql
SELECT movie_name
FROM movies
WHERE age_certificate = '18'
      AND release_date > '1999-12-31'
      AND movie_length >= 120;
```

The examples above illutrate querying records where a field is equal to a specific value.  We can also **query records where a field has a value `IN` or `NOT IN` an accepting set of values**.

```sql
SELECT movie_name
FROM movies
WHERE age_certificate IN ( '15', '18' )
      AND movie_lang NOT IN ( 'English', 'Chinese' );
```

We can also use some baby regex to query records through pattern matching, using the `LIKE` statement.

- `%` any (including zero) number of arbitrary characters
- `_`exactly one arbitrary character

```sql
-- returns all records of actors who names begin with M or end in 'la'
SELECT *
FROM actors
WHERE first_name LIKE 'M%'
      OR first_name LIKE '%la';
```

We can also use the `BETWEEN` statement to query in an **inclusive** range.

```sql
SELECT first_name,
       last_name
FROM directors
WHERE nationality IN ( 'British', 'German', 'French' )
      AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';
```

## Ordering Results

To order the results produced by a query, use the following syntax:

```sql
SELECT colname1,
       colname2
FROM tablename
ORDER BY colname3;
```

For instance to see a table ordered, not by primary key, but by the first names in the records you could do the following query,

```sql
SELECT *
FROM actors
ORDER BY first_name;
```

The default ordering is in ascending order, but if you want it in descending order you just have to specify this using the `DESC` keyword.

```sql
SELECT *
FROM actors
ORDER BY first_name DESC;
```

> `NULL` is considered the **highest** value.  So be careful when ordering records in descending order since null values will show up at the top.
> In these cases it is useful to include a `IS NOT NULL` statement in the query.

# Limiting Queries

You can set an upper bound for the number of records you want the query to return with a `LIMIT` clause.  

Suppose you want to query the three movies with the lowest domestic  and the three movies with the highest domestic revenues.  The query would look like this:

```sql
-- Three lowest revenues
SELECT *
FROM movie_revenues
ORDER BY domestic_takings
LIMIT 3;

-- Three highest revenues
SELECT *
FROM movie_revenues
WHERE domestic_takings IS NOT NULL
ORDER BY domestic_takings DESC
LIMIT 3;
```

We can also offset the limit clause.  The `OFFSET`  clause skips the offset rows **inclusively** before beginning to return the rows. If you use both `LIMIT` and `OFFSET` clauses, the OFFSET skips offset rows first before the LIMIT constrains the number of rows.

```sql
-- Returns actors with id 6-10 only
SELECT *
FROM actors
ORDER BY actor_id
LIMIT 5 OFFSET 5;
```

You can also use a `FETCH` to return a certain number of rows of data.  The syntax is as follows:

```sql
SELECT col1,
       col2
FROM table_name
FETCH FIRST X ROW ONLY;

SELECT col1,
       col2
FROM table_name
OFFSET Y
FETCH NEXT X ROW ONLY;
```

So an equivalent alternative to the queries above would be,

```sql
-- Return the three movies with the lowest revenue
SELECT *
FROM movie_revenues
ORDER BY domestic_takings
FETCH FIRST 3 ROW only;

-- Returns actors with id 6-10 only
SELECT *
FROM actors
ORDER BY actor_id
OFFSET 5
FETCH NEXT 5 ROW ONLY;
```