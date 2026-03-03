# SQL-Exercises
First Install Xampp to access mysql in Terminal only then you can use mysql in terminal. SQL Injection, SQL -> mysql2 -> ORM (prisma)


## 🧱 LEVEL 0 — CONNECT & EXIT
```sql
mysql -u root
```
Explanation: Connects to MySQL server using the root user.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

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

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
CREATE DATABASE testdb;
```
Explanation: Creates a new database named `testdb`.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
USE testdb;
```
Explanation: Selects `testdb` so all tables/queries apply to it.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

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

// Table that stores foreign key
CREATE TABLE orders (
    id CHAR(36) PRIMARY KEY,
    user_id CHAR(36),
    order_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```
Explanation:
- id → unique row identifier
- AUTO_INCREMENT → auto increases
- PRIMARY KEY → uniquely identifies rows
- VARCHAR → text
- INT → number

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SHOW TABLES;
```
Explanation: Lists tables inside the current database.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
DROP TABLE users;
```
Explanation: Deletes the table and all its data.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
ALTER TABLE users
ADD COLUMN gender VARCHAR(10);
```
Explanation: Add column in existng table, this command will add gender column in table.

---

## 🟢 LEVEL 3 — INSERT (CREATE DATA)
Single row
```sql
INSERT INTO users (name, email, age)
VALUES ('Rahul', 'rahul@gmail.com', 22);
```
Explanation: Adds one record to the table.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

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
Explanation: Fetches all columns.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT name, email FROM users;
```
Explanation: Fetches only specific columns.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT * FROM users WHERE age > 23;
```
Explanation: Filters rows using conditions.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT * FROM users ORDER BY age DESC;
```
Explanation: Sorts data by age (highest first).

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT * FROM users LIMIT 2 OFFSET 1;
```
Explanation: Returns only first 2 rows and offset means page number.

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

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
DELETE FROM users;
```
Explanation: Deletes all records (table remains).

---

## 🟡 LEVEL 7 — SEARCH & FILTERING
```sql
SELECT * FROM users WHERE name LIKE 'R%';
```
Explanation: Finds names starting with R.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT * FROM users WHERE age BETWEEN 22 AND 26;
```
Explanation: Selects age in a range.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT * FROM users WHERE age IN (22, 25);
```
Explanation: Matches exact values.

---

## 🟡 LEVEL 8 — CASE SENSITIVE QUERY

```sql
SELECT * FROM users
WHERE BINARY name = 'rahul';
```
Explanation: Matches exact lowercase `rahul`. Without `BINARY`, MySQL ignores case.

---

## 🟡 LEVEL 9 — AGGREGATE FUNCTIONS
```sql
SELECT COUNT(*) FROM users;
```
Explanation: Counts total rows.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT MAX(age), MIN(age) FROM users;
```
Explanation: Finds highest & lowest values.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT AVG(age) FROM users;
```
Explanation: Finds average age.

---

## 🟡 LEVEL 10 — GROUP BY

```sql
SELECT age, COUNT(*)
FROM users
GROUP BY age;
```
Explanation: Groups rows by age and counts each group.

---

## 🟡 LEVEL 11 — JOINS (RELATIONSHIP)
```sql
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  amount INT
);
```
Explanation: Creates related table using `user_id`.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT users.name, orders.amount
FROM users
JOIN orders
ON users.id = orders.user_id;
```
Explanation: Combines data from two tables using a common key.

---

## 🔵 LEVEL 12 — PAGINATION
```sql
SELECT * FROM users
ORDER BY id
LIMIT 5 OFFSET 0;
```
Explanation: Page 1 → first 5 records.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SELECT * FROM users
ORDER BY id
LIMIT 5 OFFSET 5;
```
Explanation: Page 2 → skip first 5, show next 5.

---

## 🔵 LEVEL 13 — INDEX (PERFORMANCE)
```sql
CREATE INDEX idx_email ON users(email);
```
Explanation: Speeds up search on `email`.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
SHOW INDEX FROM users;
```
Explanation: Shows indexes on the table.

---

## 🔵 LEVEL 14 — USERS & SECURITY

```sql
CREATE USER 'appuser'@'localhost'
IDENTIFIED BY 'password';
```
Explanation: Creates a non-root user for applications.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```sql
GRANT ALL PRIVILEGES ON testdb.*
TO 'appuser'@'localhost';
FLUSH PRIVILEGES;
```
Explanation: Gives access only to one database (safe).

---

## 🔵 LEVEL 15 — BACKUP & RESTORE (CMD)

```bash
mysqldump -u root testdb > testdb.sql
```
Explanation: Creates database backup.

﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘﹘

```bash
mysql -u root testdb < testdb.sql
```
Explanation: Restores backup.

---

## 🔥 LEVEL 16 — PRO LEVEL
### Subquery

```bash
SELECT * FROM users
WHERE age > (SELECT AVG(age) FROM users);
```
Explanation: Finds users older than average age.


### Transaction (safety)

```sql
START TRANSACTION;
DELETE FROM users WHERE id = 1;
ROLLBACK;
```
Explanation: Undo changes if something goes wrong.

---




