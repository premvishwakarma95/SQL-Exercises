
# SQL Master Project (No ORM)

This project is a complete SQL practice backend using:

- Node.js
- Express.js
- PostgreSQL
- Raw SQL Queries only
- No ORM

## Concepts Covered

- CREATE TABLE
- INSERT
- UPDATE
- DELETE
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT / OFFSET
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Aggregate Functions
- Subqueries
- Views
- Indexes
- Transactions
- Stored Procedures
- Triggers
- Pagination
- Authentication Queries
- Complex Reports

## Setup

```bash
npm install
```

Create PostgreSQL database:

```sql
CREATE DATABASE sql_master_project;
```

Import schema:

```bash
psql -U postgres -d sql_master_project -f database/schema.sql
```

Seed database:

```bash
psql -U postgres -d sql_master_project -f database/seed.sql
```

Run project:

```bash
npm run dev
```

## API Endpoints

### Users
- GET /users
- GET /users/:id
- POST /users
- PUT /users/:id
- DELETE /users/:id

### Products
- GET /products
- POST /products

### Orders
- GET /orders/report
- POST /orders

### Analytics
- GET /analytics/top-customers
- GET /analytics/sales-report
