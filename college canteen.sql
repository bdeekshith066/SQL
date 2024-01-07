create database canteen;
use canteen;

CREATE TABLE students (
    usn VARCHAR(10) PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL CHECK (email LIKE '%_@__%.__%'),
    phone_number VARCHAR(10) NOT NULL CHECK (LENGTH(phone_number) = 10),
    hashed_password VARCHAR(64) NOT NULL 
);

CREATE TABLE canteen (
    canteen_id INT PRIMARY KEY,
    canteen_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    canteen_id INT,
    category_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (canteen_id) REFERENCES canteen(canteen_id)
);


CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    category_id INT,
    item_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    student_usn VARCHAR(10),
    canteen_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (student_usn) REFERENCES students(usn),
    FOREIGN KEY (canteen_id) REFERENCES canteen(canteen_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

INSERT INTO canteen (canteen_id, canteen_name, location)
VALUES
(1, 'Library Canteen', 'PJ Block First Floor'),
(2, 'Vidyarthi Khana Engineering Canteen', 'Adjacent to Sports Complex'),
(3, 'Vidyarthi Khana Law Canteen', 'Adjacent to Mech Block');

INSERT INTO categories (category_id, canteen_id, category_name) VALUES
(1, 1, 'Sandwiches'),
(2, 1, 'Burgers'),
(3, 1, 'Juices');

INSERT INTO categories (category_id, canteen_id, category_name) VALUES
(4, 2, 'Dosa'),
(5, 2, 'Fried Rice');



INSERT INTO menu_items (item_id, category_id, item_name, price) VALUES
(1, 1, 'American Sweet Corn Sandwich', 40.00),
(2, 1, 'Cheese Sandwich', 40.00),
(3, 1, 'Cheese Chilly Sandwich', 40.00);

INSERT INTO menu_items (item_id, category_id, item_name, price) VALUES
(11, 2, 'Veg Burger', 45.00),
(12, 2, 'Cheese Burger Paneer Burger', 55.00);

INSERT INTO menu_items (item_id, category_id, item_name, price) VALUES
(21, 3, 'Watermelon Juice', 30.00),
(22, 3, 'Orange Juice', 40.00);


INSERT INTO menu_items (item_id, category_id, item_name, price) VALUES
(13, 4, 'Plain Dosa', 40.00),
(14, 4, 'Masala Dosa', 50.00);

INSERT INTO menu_items (item_id, category_id, item_name, price) VALUES
(23, 5, 'Veg Fried Rice', 60.00),
(24, 5, 'Egg Fried Rice', 70.00);

