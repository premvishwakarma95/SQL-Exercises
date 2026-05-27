# SQL BOLT EXERCISE.
https://sqlbolt.com/

## SELECT queries.
```sql
SELECT Title, Director FROM movies;
```

## Queries with constraints.
constraints are predefined rules applied to table columns to limit the type of data that can be stored. Like we call keywords in langauge.  
- Find the movie with a row id of 6
```sql
SELECT * FROM movies WHERE Id == 6;
```
- Find the movies released in the years between 2000 and 2010 ✓
```sql
SELECT * FROM movies WHERE Year BETWEEN 2000 AND 2010 ;
SELECT * FROM movies WHERE Year >= 2000 AND Year <= 2010 ;
```
- Find the movies not released in the years between 2000 and 2010
```sql
SELECT * FROM movies WHERE Year NOT BETWEEN 2000 AND 2010 ;
```
- Find these list movies.
```sql
SELECT * FROM movies WHERE Id IN (2, 4, 6);
```
- Find other movies that are not in list.
```sql
SELECT * 
FROM movies
WHERE movie_id NOT IN (1, 3, 5);
```
- Find first 5 movies.
```sql
SELECT * FROM movies LIMIT 5;
```
- Find movie name that starts with 'Toy Story' or can say find all 'Toy Story' movie.
Like operator used to find incasesensitive. example - small and uppercase both.
```sql
SELECT * FROM movies WHERE Director LIKE 'Toy Story%';
```
- Find All movies that are not directed by John Lasseter.
```sql
SELECT * FROM movies WHERE Director != 'John Lasseter';
```

---

## Filtering and sorting Query results
```sql
SELECT column, another_column
FROM mytable
WHERE condition
ORDER BY column ASC
LIMIT 5 OFFSET 10;
```
- `DISTINCT` - is used to remove duplicate values from the result. Query - `SELECT DISTINCT column_name FROM table_name;`.
- `ORDER BY` - Used to sort the result. Query - `ORDER BY age`.
- `ASC` - Ascending order (small → large, A → Z). Query - `ORDER BY age ASC`.
- `DESC` - Descending order (large → small, Z → A). Query - `ORDER BY age DESC`.
- `LIMIT` - Restricts the number of rows returned. Query - `LIMIT 5`.
- `OFFSET` - Skips rows before starting to return results. Query - `LIMIT 5 OFFSET 10`
- Full Example
```sql
SELECT name, salary
FROM employees
WHERE salary > 50000
ORDER BY salary DESC
LIMIT 3 OFFSET 2;
```

- List all directors of movies (alphabetically), without duplicates
```sql
SELECT DISTINCT director FROM movies
ORDER BY director ASC;
```
- List the last four movies released (ordered from most recent to least)
```sql
SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;
```
- List the next five Pixar movies sorted alphabetically
```sql
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;
```
- List the third and fourth largest cities (by population) in the United States and their population.
```sql
SELECT city, population, country FROM north_american_cities
WHERE country = 'United States'
ORDER BY population DESC
LIMIT 2 OFFSET 2;
```

---

## Multi-table queries with JOINs.
Using the JOIN clause in a query, we can combine row data across two separate tables using this unique key.
<img width="1456" height="380" alt="image" src="https://github.com/user-attachments/assets/f2f53f69-a1f5-4077-ac67-aa07170cedd9" />
### TYPES OF JOINS.
- Inner Join
- Outer Join  
Types of `OUTER JOIN`.
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN

### INNER JOIN - (A ∩ B) - Only common rows.
It is used to combine rows from two tables only when matching data exists in both tables.  
- Example - Give me only the common matching records  
- Syntax
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```
- Find the domestic and international sales for each movie
```sql
SELECT title, domestic_sales, international_sales 
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
```
- List all the movies by their ratings in descending order
```sql
SELECT title, rating
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;
```

### LEFT JOIN - (A+(A∩B)) - All left rows + matched right rows.
- all rows from the left table
- matching rows from the right table
- if no match exists → right table columns become `NULL`
- Syntax
```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;
```
- Find rating of all movies.
```sql
SELECT 
    movies.title,
    boxoffice.rating
FROM movies
LEFT JOIN boxoffice
ON movies.id = boxoffice.movie_id;
```

### RIGHT JOIN - (B+(A∩B)) - All right rows + matched right rows.
- all rows from the right table
- matching rows from the left table
- if no match exists → left table columns become `NULL`
- syntax
```sql
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```

### FULL JOIN - (A∪B) - Keep everything.
- all rows from the left table
- all rows from the right table
- matched rows combined
- unmatched rows filled with NULL
- syntax
```sql
SELECT columns
FROM table1
FULL JOIN table2
ON table1.column = table2.column;
```

---

## A short note on NULLs
- `IS NULL`
- `IS NOT NULL`
- Find the name and role of all employees who have not been assigned to a building 
```sql
SELECT name, role FROM employees
WHERE building IS NULL;
```
- Find the names of the buildings that hold no employees
```sql
SELECT DISTINCT building_name
FROM buildings 
  LEFT JOIN employees
    ON building_name = building
WHERE role IS NULL;
```

---

## Queries with expressions
List all movies and their ratings in percent
```sql
SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
```
