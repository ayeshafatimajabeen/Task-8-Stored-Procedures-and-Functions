#  Task 8: Stored Procedures and Functions

##  Objective
Learn how to modularize SQL logic using:
- Stored Procedures (`CREATE PROCEDURE`)
- Functions (`CREATE FUNCTION`)

##  Tools Used
- MySQL Workbench  
(Note: SQLite does **not** support stored procedures or functions.)

---

##  What Are Stored Procedures and Functions?

###  Stored Procedure
A **stored procedure** is a reusable block of SQL statements that can perform actions like `INSERT`, `UPDATE`, or `DELETE`.

- Accepts **input parameters**
- Can include **conditional logic** (`IF`, `ELSE`)
- Can be called with: `CALL procedure_name(...)`

###  Function
A **function** is a reusable SQL block that **returns a single value**.

- Accepts **input parameters**
- Cannot modify data (read-only)
- Returns a **computed value**
- Can be used in `SELECT` statements

---

##  Differences Between Procedure and Function

| Feature            | Stored Procedure     | Function               |
|--------------------|----------------------|------------------------|
| Returns a value?   | Optional             | Always returns a value |
| Used in SELECT?    | ❌ No                | ✅ Yes                 |
| Can modify data?   | ✅ Yes               | ❌ No                 |
| Called using       | `CALL`               | `SELECT`               |

---



