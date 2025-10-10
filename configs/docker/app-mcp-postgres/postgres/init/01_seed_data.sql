-- USERS
INSERT INTO demo.users (full_name, email)
SELECT 'User ' || gs, 'user' || gs || '@example.com'
FROM generate_series(1, 200) gs
ON CONFLICT (email) DO NOTHING;

-- PRODUCTS
INSERT INTO demo.products (name, price)
SELECT 'Product ' || gs, ROUND((random() * 490 + 10)::numeric, 2)
FROM generate_series(1, 100) gs;

-- ORDERS
WITH u AS (SELECT id FROM demo.users ORDER BY random() LIMIT 150)
INSERT INTO demo.orders (user_id, total)
SELECT u.id, 0.00 FROM u;

-- ORDER ITEMS
INSERT INTO demo.order_items (order_id, product_id, qty, price)
SELECT
  o.id,
  p.id,
  (1 + (random() * 4)::int),
  p.price
FROM demo.orders o
JOIN LATERAL (
  SELECT id, price FROM demo.products ORDER BY random() LIMIT (1 + (random() * 3)::int)
) p ON true;

-- TOTAL
UPDATE demo.orders ord
SET total = t.sum_price
FROM (
  SELECT order_id, SUM(qty * price)::numeric(12,2) AS sum_price
  FROM demo.order_items
  GROUP BY order_id
) t
WHERE t.order_id = ord.id;
