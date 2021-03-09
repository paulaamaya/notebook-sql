- [Introduction to Databases](#introduction-to-databases)
- [SQL Theory](#sql-theory)
  - [Data Definition Language (DDL)](#data-definition-language-ddl)


# Introduction to Databases

Structured Query Language (SQL) is a declarative programming language that allows you to create,manipulate, and share data specifically from Relational Database Systems.

**Database:** Systematic collection of data.

**Database Management System (DBMS):** A collection of programs that enables users to access a database, munipulate data, and helps in the representation of data.  It also helps control access to the database by various users.

**Query:** Piece of code inducing the computer to execute a certain operation that will deliver the desired output.

**Entity:** The smallest unit that can contain a meaningful set of data. E.g. a row (record) in a table represents its horizontal entity and a column (field) its vertical entity.

| ID    | Name          | Balance |
| ------|---------------| -------:|
| 001   | John Doe      | $1600   |
| 002   | Jane Doe      |   $12   |
| 003   | Sally Smith   |    $1   |

---

# SQL Theory

SQL's syntax comprises several types of statements that allow you to perform various commands and operations.

## Data Definition Language (DDL)

Set of statements that alloww the user to define or modify data structures and objects (e.g. the `CREATE` statement).

```sql
-- create a table with a single column
CREATE TABLE sales (purchase_number INT);

-- add another column to it
ALTER TABLE sales
ADD COLUMN date_of_purchase DATE;

-- rename the table
RENAME TABLE sales TO sales_data;

-- delete the table
DROP TABLE sales_data;

-- alternatively just empty the table
TRUNCATE TABLE sales_data;
```