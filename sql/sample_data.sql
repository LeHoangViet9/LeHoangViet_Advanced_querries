CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(100),
    join_date DATE DEFAULT CURRENT_DATE
);
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0),
    stock_quantity INT CHECK (stock_quantity >= 0),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(12,2) CHECK (total_amount >= 0),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    unit_price DECIMAL(10,2) CHECK (unit_price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Thiết bị điện tử'),
('Furniture', 'Nội thất gia đình'),
('Books', 'Sách và tài liệu'),
('Clothing', 'Thời trang');

INSERT INTO customers (customer_name, email, city, join_date) VALUES
('Nguyễn Văn A', 'a@gmail.com', 'Hà Nội', '2024-01-10'),
('Trần Thị B', 'b@gmail.com', 'TP HCM', '2024-02-15'),
('Lê Văn C', 'c@gmail.com', 'Đà Nẵng', '2024-03-05');

INSERT INTO products (product_name, category_id, price, stock_quantity) VALUES
('Laptop Dell', 1, 1500.00, 20),
('iPhone 15', 1, 1200.00, 15),
('Bàn học gỗ', 2, 300.00, 10),
('Ghế xoay', 2, 200.00, 12),
('Sách SQL Cơ Bản', 3, 25.00, 50);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-04-01', 3000.00, 'Completed'),
(2, '2024-04-03', 1700.00, 'Completed'),
(3, '2024-04-05', 25.00, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 1500.00),
(2, 2, 1, 1200.00),
(2, 4, 1, 200.00),
(3, 5, 1, 25.00);


