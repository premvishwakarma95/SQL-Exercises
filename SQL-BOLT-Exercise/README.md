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
