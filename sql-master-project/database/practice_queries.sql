
-- BASIC SELECT
SELECT * FROM users;

-- WHERE
SELECT * FROM users WHERE age > 25;

-- ORDER BY
SELECT * FROM products ORDER BY price DESC;

-- GROUP BY
SELECT category_id, COUNT(*) FROM products GROUP BY category_id;

-- HAVING
SELECT category_id, COUNT(*)
FROM products
GROUP BY category_id
HAVING COUNT(*) > 1;

-- INNER JOIN
SELECT u.name, o.total
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

-- LEFT JOIN
SELECT u.name, o.total
FROM users u
LEFT JOIN orders o ON u.id = o.user_id;

-- AGGREGATES
SELECT SUM(total) FROM orders;
SELECT AVG(price) FROM products;
SELECT MAX(price) FROM products;

-- SUBQUERY
SELECT * FROM products
WHERE price > (
    SELECT AVG(price) FROM products
);

-- TRANSACTION
BEGIN;
UPDATE products SET stock = stock - 1 WHERE id = 1;
COMMIT;
