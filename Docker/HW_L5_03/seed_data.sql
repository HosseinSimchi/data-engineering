INSERT INTO categories (name) VALUES
('Electronics'), ('Grocery'), ('Stationery'), ('Furniture');

INSERT INTO suppliers (name, phone, email) VALUES
('Pars Electronics Co.', '02122334455', 'sales@parselec.com'),
('Tehran Office Supply', '02133445566', 'info@tehranoffice.com'),
('Iran Food Distribution', '02144556677', 'contact@iranfood.com');

INSERT INTO products (name, category_id, supplier_id, unit_price) VALUES
('Laptop',     1, 1, 25000000),   -- 1
('Smartphone', 1, 1, 15000000),   -- 2
('Headphone',  1, 2,  1200000),   -- 3
('Keyboard',   1, 2,   800000),   -- 4
('Mouse',      1, 2,   500000),   -- 5
('Monitor',    1, 1,  6000000),   -- 6
('Rice',       2, 3,   300000),   -- 7
('Oil',        2, 3,   250000),   -- 8
('Sugar',      2, 3,   150000),   -- 9
('Tea',        2, 3,   180000),   -- 10
('Notebook',   3, 2,    50000),   -- 11
('Pen',        3, 2,    15000),   -- 12
('Pencil',     3, 2,    10000),   -- 13
('Eraser',     3, 2,     5000),   -- 14
('Ruler',      3, 2,     8000),   -- 15
('Sofa',       4, 1, 12000000),   -- 16
('Table',      4, 1,  4000000);   -- 17

INSERT INTO warehouses (name, city) VALUES
('Tehran-Main', 'Tehran'),
('Isfahan-Branch', 'Isfahan'),
('Shiraz-Branch', 'Shiraz');

INSERT INTO inventory (warehouse_id, product_id, quantity) VALUES
(1,1,50),(1,2,80),(1,3,120),(1,4,200),(1,5,300),(1,6,40),
(1,7,500),(1,8,450),(1,9,600),(1,10,400),
(1,11,800),(1,12,1000),(1,13,900),(1,14,700),(1,15,600),
(1,16,20),(1,17,35),

(2,1,30),(2,2,60),(2,3,90),(2,4,150),(2,5,250),(2,6,25),
(2,7,300),(2,8,280),(2,9,320),(2,10,200),
(2,11,400),(2,12,500),(2,13,450),(2,14,350),(2,15,300),
(2,16,15),(2,17,20),

(3,1,20),(3,2,40),(3,3,70),(3,4,100),(3,5,180),(3,6,15),
(3,7,200),(3,8,180),(3,9,220),(3,10,150),
(3,11,250),(3,12,300),(3,13,280),(3,14,220),(3,15,200),
(3,16,10),(3,17,12);

INSERT INTO customers (name, email, phone, city) VALUES
('Ali Ahmadi',    'ali.ahmadi@example.com',    '09121111111', 'Tehran'),
('Sara Karimi',   'sara.karimi@example.com',   '09122222222', 'Tehran'),
('Reza Moradi',   'reza.moradi@example.com',   '09123333333', 'Isfahan'),
('Maryam Hosseini','maryam.hosseini@example.com','09124444444','Shiraz'),
('Hossein Rahimi','hossein.rahimi@example.com','09125555555', 'Isfahan'),
('Neda Sadeghi',  'neda.sadeghi@example.com',  '09126666666', 'Tehran');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2026-01-05'), -- 1
(2, '2026-01-06'), -- 2
(3, '2026-01-07'), -- 3
(1, '2026-01-10'), -- 4
(4, '2026-01-11'), -- 5
(5, '2026-01-12'), -- 6
(2, '2026-01-14'), -- 7
(6, '2026-01-15'), -- 8
(3, '2026-01-17'), -- 9
(4, '2026-01-18'), -- 10
(1, '2026-01-20'), -- 11
(5, '2026-01-21'), -- 12
(6, '2026-01-23'), -- 13
(2, '2026-01-25'), -- 14
(3, '2026-01-27'); -- 15

-- unit_price ثبت‌شده در اینجا برابر قیمت کالا در زمان فروش است
INSERT INTO items_order (order_id, product_id, quantity, unit_price) VALUES
(1,  1, 2, 25000000), (1,  3, 5, 1200000),
(2,  2, 3, 15000000), (2,  5, 10, 500000),
(3,  4, 8, 800000),   (3,  6, 4, 6000000),
(4,  11, 50, 50000),  (4,  12, 100, 15000),
(5,  13, 80, 10000),  (5,  14, 60, 5000),
(6,  15, 40, 8000),   (6,  7, 20, 300000),
(7,  8, 15, 250000),  (7,  9, 30, 150000),
(8,  1, 1, 25000000), (8,  16, 2, 12000000),
(9,  17, 3, 4000000), (9,  5, 20, 500000),
(10, 3, 10, 1200000), (10, 12, 50, 15000),
(11, 6, 2, 6000000),  (11, 9, 10, 150000),
(12, 2, 2, 15000000), (12, 14, 30, 5000),
(13, 4, 5, 800000),   (13, 11, 20, 50000),
(14, 1, 3, 25000000),
(15, 13, 40, 10000),  (15, 15, 20, 8000);
