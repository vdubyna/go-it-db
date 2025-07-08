## Висновок
При заміні деяких операторів INNER JOIN на LEFT чи RIGHT JOIN у складному запиті з багатьма з'єднаннями:
1. **Обмежуючий фактор**: Оператори INNER JOIN в ланцюжку з'єднань діють як "вузьке місце" - вони обмежують загальний набір результатів, навіть якщо деякі з'єднання є зовнішніми (LEFT/RIGHT).
2. **Зміна кількості рядків**:
    - Якщо замінити ВСІ INNER JOIN на LEFT JOIN, починаючи від базової таблиці, кількість рядків не збільшується.
    - Якщо замінити лише деякі INNER JOIN на RIGHT JOIN, але залишити інші як LEFT JOIN, кількість рядків, збільшується.

```sql
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
left JOIN orders o 
    ON od.order_id = o.id
RIGHT JOIN customers c 
    ON o.customer_id = c.id
left JOIN products p 
    ON od.product_id = p.id
left JOIN categories cat 
    ON p.category_id = cat.id
left JOIN employees e 
    ON o.employee_id = e.employee_id
left JOIN shippers s 
    ON o.shipper_id = s.id
left JOIN suppliers sup 
    ON p.supplier_id = sup.id;
```