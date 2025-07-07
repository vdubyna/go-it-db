CREATE TABLE Orders_1NF (
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    client_name VARCHAR(100),
    client_address VARCHAR(255),
    order_date DATE
);
INSERT INTO Orders_1NF (order_id, product_name, quantity, client_name, client_address, order_date)
VALUES
(101, 'Лептоп', 3, 'Мельник', 'Хрещатик 1', '2023-03-15'),
(101, 'Мишка', 2, 'Мельник', 'Хрещатик 1', '2023-03-15'),
(102, 'Принтер', 1, 'Шевченко', 'Басейна 2', '2023-03-16'),
(103, 'Мишка', 4, 'Коваленко', "Комп'ютерна 3", '2023-03-17');