
const express = require('express');
const pool = require('./db');

const app = express();
app.use(express.json());

app.get('/users', async (req, res) => {
    const result = await pool.query('SELECT * FROM users ORDER BY id DESC');
    res.json(result.rows);
});

app.get('/analytics/top-customers', async (req, res) => {
    const query = `
        SELECT u.name, SUM(o.total) as total_spent
        FROM users u
        INNER JOIN orders o ON u.id = o.user_id
        GROUP BY u.name
        ORDER BY total_spent DESC
    `;

    const result = await pool.query(query);
    res.json(result.rows);
});

app.get('/analytics/sales-report', async (req, res) => {
    const query = `
        SELECT 
            p.name,
            SUM(oi.quantity) as total_quantity,
            SUM(oi.price * oi.quantity) as revenue
        FROM order_items oi
        INNER JOIN products p ON p.id = oi.product_id
        GROUP BY p.name
        ORDER BY revenue DESC
    `;

    const result = await pool.query(query);
    res.json(result.rows);
});

app.listen(5000, () => {
    console.log('Server running on port 5000');
});
