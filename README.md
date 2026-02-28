# SQL-Exercises

## 🧱 LEVEL 0 — CONNECT & EXIT
```sql
mysql -u root
```
Explanation: Connects to MySQL server using the root user.
-
```sql
exit;
```
Explanation: Safely exits the MySQL shell.

---

## 🟢 LEVEL 1 — DATABASE QUERIES (FOUNDATION)
```sql
SHOW DATABASES;
```
Explanation: Lists all databases available on the server.
-
```sql
CREATE DATABASE testdb;
```
Explanation: Creates a new database named `testdb`.
-
```sql
USE testdb;
```
Explanation: Selects `testdb` so all tables/queries apply to it.
-
```sql
DROP DATABASE testdb;
```
Explanation: Deletes the database permanently (data lost).

---

## 🟢 LEVEL 2 — TABLE QUERIES

```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100),
  age INT
);
```
Explanation:
- id → unique row identifier
- AUTO_INCREMENT → auto increases
- PRIMARY KEY → uniquely identifies rows
- VARCHAR → text
- INT → number

```sql
SHOW TABLES;
```
Explanation: Lists tables inside the current database.
-
```sql
DROP TABLE users;
```
Explanation: Deletes the table and all its data.

---

## 🟢 LEVEL 3 — INSERT (CREATE DATA)
Single row
```sql
INSERT INTO users (name, email, age)
VALUES ('Rahul', 'rahul@gmail.com', 22);
```
Explanation: Adds one record to the table.
-
Multiple rows (best practice)
```sql
INSERT INTO users (name, email, age)
VALUES
('Shubham', 'shubham@gmail.com', 26),
('Harsh', 'harsh@gmail.com', 25),
('Rahul', 'rahul@gmail.com', 22);
```
Explanation: Inserts multiple rows in one query (faster).

---

## 🟢 LEVEL 4 — SELECT (READ DATA)
```sql
SELECT * FROM users;
```
Explanation: Fetches only specific columns.
-
```sql
SELECT name, email FROM users;
```
Explanation: Fetches only specific columns.
-
```sql
SELECT * FROM users WHERE age > 23;
```
Explanation: Filters rows using conditions.
-
```sql
SELECT * FROM users ORDER BY age DESC;
```
Explanation: Sorts data by age (highest first).
-
```sql
SELECT * FROM users LIMIT 2;
```
Explanation: Returns only first 2 rows.

---

## 🟢 LEVEL 5 — UPDATE (MODIFY DATA)

```sql
UPDATE users
SET age = 27
WHERE name = 'Shubham';
```
Explanation: Updates age only for matching rows. ⚠️ Without `WHERE`, all rows change.

---

## 🟢 LEVEL 6 — DELETE (REMOVE DATA)

```sql
DELETE FROM users WHERE name = 'Harsh';
```
Explanation: Deletes only matching rows.
-
```sql
DELETE FROM users;
```
Explanation: Deletes all records (table remains).
