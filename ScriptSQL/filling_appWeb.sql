INSERT INTO User (last_name, first_name, email, phone, address, password)
VALUES
('Smith', 'John', 'john.smith@example.com', '1234567890', '123 Main St, City A', 'password1'),
('Doe', 'Jane', 'jane.doe@example.com', '2345678901', '456 Elm St, City B', 'password2'),
('Brown', 'Charlie', 'charlie.brown@example.com', '3456789012', '789 Oak St, City C', 'password3'),
('Johnson', 'Emily', 'emily.johnson@example.com', '4567890123', '101 Pine St, City D', 'password4'),
('Miller', 'Michael', 'michael.miller@example.com', '5678901234', '202 Maple St, City E', 'password5');

INSERT INTO Category (name, description)
VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Apparel and accessories'),
('Books', 'Books and magazines'),
('Home', 'Furniture and home decor'),
('Toys', 'Children’s toys and games');

INSERT INTO Product (label, description, price, stock, category_id)
VALUES
('Smartphone', 'Latest model smartphone', 699.99, 50, 1),
('T-Shirt', 'Cotton T-shirt with print', 19.99, 200, 2),
('Novel', 'Best-selling fiction novel', 14.99, 100, 3),
('Sofa', 'Comfortable living room sofa', 399.99, 20, 4),
('Action Figure', 'Collectible action figure', 29.99, 150, 5);

INSERT INTO CustomerOrder (user_id, total, status)
VALUES
(1, 699.99, 'PAID'),
(2, 19.99, 'PENDING'),
(3, 14.99, 'PAID'),
(4, 399.99, 'PAID'),
(5, 29.99, 'PENDING');

INSERT INTO OrderLine (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 699.99),  -- John Smith a acheté un smartphone
(2, 2, 1, 19.99),  -- Jane Doe a commandé un T-shirt
(3, 3, 1, 14.99),  -- Charlie Brown a acheté un livre
(4, 4, 1, 399.99), -- Emily Johnson a acheté un sofa
(5, 5, 1, 29.99);  -- Michael Miller a commandé une figurine
