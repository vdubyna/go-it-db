CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE Order_Products (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);