INSERT INTO customers (name, email, city) VALUES
    ('Ali Rezaei',     'ali.rezaei@example.com',     'Tehran'),
    ('Sara Ahmadi',    'sara.ahmadi@example.com',    'Shiraz'),
    ('Reza Karimi',    'reza.karimi@example.com',    'Isfahan'),
    ('Mina Hosseini',  'mina.hosseini@example.com',  'Tabriz'),
    ('Nima Ghasemi',   'nima.ghasemi@example.com',   'Mashhad');

INSERT INTO products (name, price, stock, category) VALUES
    ('Laptop',        1200.00, 15,  'Electronics'),
    ('Smartphone',     800.00, 30,  'Electronics'),
    ('Headphones',      50.00, 100, 'Accessories'),
    ('Desk Chair',     150.00, 20,  'Furniture'),
    ('Coffee Maker',    90.00, 25,  'Home Appliances'),
    ('Backpack',        40.00, 60,  'Accessories');

INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
    (1, 1, 1, '2026-01-05'),  
    (1, 3, 2, '2026-01-06'),  
    (1, 6, 1, '2026-01-10'),  
    (2, 2, 1, '2026-01-07'),  
    (2, 4, 1, '2026-01-08'),  
    (2, 5, 2, '2026-01-09'),  
    (3, 3, 3, '2026-01-11'),  
    (3, 1, 1, '2026-01-12'),  
    (4, 2, 2, '2026-01-13'),  
    (4, 6, 1, '2026-01-14'); 
