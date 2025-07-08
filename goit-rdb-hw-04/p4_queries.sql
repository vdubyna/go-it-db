SELECT
    od.id AS order_detail_id,
    od.quantity,
    o.id AS order_id,
    o.date AS order_date,
    c.id AS customer_id,
    c.name AS customer_name,
    c.city AS customer_city,
    c.country AS customer_country,
    p.id AS product_id,
    p.name AS product_name,
    p.price AS product_price,
    p.unit,
    cat.id AS category_id,
    cat.name AS category_name,
    cat.description AS category_description,
    e.employee_id,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    s.id AS shipper_id,
    s.name AS shipper_name,
    s.phone AS shipper_phone,
    sup.id AS supplier_id,
    sup.name AS supplier_name,
    sup.city AS supplier_city,
    sup.country AS supplier_country
FROM
    order_details od
INNER JOIN orders o
    ON od.order_id = o.id
INNER JOIN customers c
    ON o.customer_id = c.id
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
INNER JOIN employees e
    ON o.employee_id = e.employee_id
INNER JOIN shippers s
    ON o.shipper_id = s.id
INNER JOIN suppliers sup
    ON p.supplier_id = sup.id;

SELECT
    count(*) AS c
FROM
    order_details od
INNER JOIN orders o
    ON od.order_id = o.id
INNER JOIN customers c
    ON o.customer_id = c.id
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
INNER JOIN employees e
    ON o.employee_id = e.employee_id
INNER JOIN shippers s
    ON o.shipper_id = s.id
INNER JOIN suppliers sup
    ON p.supplier_id = sup.id;

SELECT
    od.id AS order_detail_id,
    od.quantity,
    o.id AS order_id,
    o.date AS order_date,
    c.id AS customer_id,
    c.name AS customer_name,
    c.city AS customer_city,
    c.country AS customer_country,
    p.id AS product_id,
    p.name AS product_name,
    p.price AS product_price,
    p.unit,
    cat.id AS category_id,
    cat.name AS category_name,
    cat.description AS category_description,
    e.employee_id,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    s.id AS shipper_id,
    s.name AS shipper_name,
    s.phone AS shipper_phone,
    sup.id AS supplier_id,
    sup.name AS supplier_name,
    sup.city AS supplier_city,
    sup.country AS supplier_country
FROM
    order_details od
INNER JOIN orders o
    ON od.order_id = o.id
INNER JOIN customers c
    ON o.customer_id = c.id
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
INNER JOIN employees e
    ON o.employee_id = e.employee_id AND e.employee_id > 3 AND e.employee_id <= 10
INNER JOIN shippers s
    ON o.shipper_id = s.id
INNER JOIN suppliers sup
    ON p.supplier_id = sup.id;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS average_quantity
FROM
    order_details od
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
GROUP BY
    cat.name
ORDER BY
    cat.name;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS average_quantity
FROM
    order_details od
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
GROUP BY
    cat.name
HAVING
    average_quantity > 21
ORDER BY
    average_quantity DESC;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS average_quantity
FROM
    order_details od
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
GROUP BY
    cat.name
HAVING
    average_quantity > 21
ORDER BY
    row_count DESC;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS average_quantity
FROM
    order_details od
INNER JOIN products p
    ON od.product_id = p.id
INNER JOIN categories cat
    ON p.category_id = cat.id
GROUP BY
    cat.name
HAVING
    average_quantity > 21
ORDER BY
    row_count DESC
LIMIT 4 OFFSET 1;