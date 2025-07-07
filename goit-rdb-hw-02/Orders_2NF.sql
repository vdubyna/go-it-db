-- Таблиця замовлень
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    client_address VARCHAR(255),
    order_date DATE
);

-- Таблиця товарів у замовленні
CREATE TABLE Order_Items (
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    PRIMARY KEY (order_id, product_name),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);