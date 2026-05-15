
INSERT INTO users(name,email,age) VALUES
('Prem','prem@gmail.com',24),
('Rahul','rahul@gmail.com',26),
('Aman','aman@gmail.com',28);

INSERT INTO categories(name) VALUES
('Electronics'),
('Books'),
('Fashion');

INSERT INTO products(name,price,stock,category_id) VALUES
('Laptop',75000,5,1),
('Keyboard',2000,10,1),
('NodeJS Book',500,20,2),
('Tshirt',800,15,3);

INSERT INTO orders(user_id,total) VALUES
(1,77000),
(2,500);

INSERT INTO order_items(order_id,product_id,quantity,price) VALUES
(1,1,1,75000),
(1,2,1,2000),
(2,3,1,500);
