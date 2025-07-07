-- Create the database schema
CREATE SCHEMA IF NOT EXISTS foodmarket;
USE foodmarket;

-- Create Categories table
CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Create Suppliers table
CREATE TABLE IF NOT EXISTS suppliers (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    phone VARCHAR(20)
);

-- Create Products table
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    supplier_id INT,
    category_id INT,
    unit VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create Employees table
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    birthdate DATE,
    photo VARCHAR(50),
    notes TEXT
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50)
);

-- Create Shippers table
CREATE TABLE IF NOT EXISTS shippers (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    date DATE,
    shipper_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (shipper_id) REFERENCES shippers(id)
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS order_details (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);