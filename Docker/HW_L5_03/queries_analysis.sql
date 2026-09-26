
SELECT
    c.category_id,
    c.name                                   AS category_name,
    COUNT(DISTINCT p.product_id)             AS product_count,
    COALESCE(SUM(io.quantity), 0)            AS total_units_sold,
    COALESCE(SUM(io.quantity * io.unit_price), 0) AS total_revenue
FROM categories c
JOIN products p        ON p.category_id = c.category_id
LEFT JOIN items_order io ON io.product_id = p.product_id
GROUP BY c.category_id, c.name
HAVING COUNT(DISTINCT io.product_id) >= 5;


SELECT
    warehouse_name,
    product_name,
    quantity,
    stock_rank
FROM (
    SELECT
        w.name AS warehouse_name,
        p.name AS product_name,
        i.quantity,
        RANK() OVER (PARTITION BY i.warehouse_id ORDER BY i.quantity DESC) AS stock_rank
    FROM inventory i
    JOIN warehouses w ON w.warehouse_id = i.warehouse_id
    JOIN products p   ON p.product_id   = i.product_id
) ranked
WHERE stock_rank <= 3
ORDER BY warehouse_name, stock_rank;


WITH customer_totals AS (
    SELECT
        o.customer_id,
        COUNT(DISTINCT o.order_id)                    AS order_count,
        SUM(io.quantity * io.unit_price)              AS total_spent
    FROM orders o
    JOIN items_order io ON io.order_id = o.order_id
    GROUP BY o.customer_id
)
SELECT
    c.customer_id,
    c.name                                   AS customer_name,
    ct.total_spent,
    ct.order_count,
    ROUND(ct.total_spent / ct.order_count, 2) AS avg_order_amount
FROM customer_totals ct
JOIN customers c ON c.customer_id = ct.customer_id
WHERE ct.total_spent > (SELECT AVG(total_spent) FROM customer_totals)
ORDER BY ct.total_spent DESC;


WITH product_sales AS (
    SELECT
        p.product_id,
        p.name AS product_name,
        COALESCE(SUM(io.quantity), 0) AS total_sold
    FROM products p
    LEFT JOIN items_order io ON io.product_id = p.product_id
    GROUP BY p.product_id, p.name
),
product_inventory AS (
    SELECT product_id, SUM(quantity) AS total_inventory
    FROM inventory
    GROUP BY product_id
),
product_ratio AS (
    SELECT
        ps.product_id,
        ps.product_name,
        ps.total_sold,
        COALESCE(pi.total_inventory, 0) AS total_inventory,
        CASE
            WHEN COALESCE(pi.total_inventory, 0) = 0 THEN NULL
            ELSE ps.total_sold / pi.total_inventory
        END AS sales_to_inventory_ratio
    FROM product_sales ps
    LEFT JOIN product_inventory pi ON pi.product_id = ps.product_id
),
ranked_ratio AS (
    SELECT
        pr.*,
        PERCENT_RANK() OVER (ORDER BY sales_to_inventory_ratio DESC) AS pct_rank
    FROM product_ratio pr
    WHERE sales_to_inventory_ratio IS NOT NULL
)
SELECT
    product_id,
    product_name,
    total_sold,
    total_inventory,
    ROUND(sales_to_inventory_ratio, 4) AS sales_to_inventory_ratio
FROM ranked_ratio
WHERE pct_rank <= 0.10
ORDER BY sales_to_inventory_ratio DESC;
