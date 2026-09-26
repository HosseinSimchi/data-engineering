SELECT
    c.name     AS customer_name,
    p.name     AS product_name,
    o.quantity AS order_quantity
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products  p ON o.product_id  = p.id
ORDER BY o.id;

SELECT
    p.name             AS product_name,
    SUM(o.quantity)    AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name
ORDER BY total_sold DESC;

SELECT
    c.name          AS customer_name,
    COUNT(o.id)     AS order_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.id) > 2
ORDER BY order_count DESC;


SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 1;


SELECT
    c.name       AS customer_name,
    o.id         AS order_id,
    p.name       AS product_name,
    o.quantity   AS order_quantity
FROM customers c
LEFT JOIN orders   o ON c.id = o.customer_id
LEFT JOIN products p ON o.product_id = p.id
ORDER BY c.id;
