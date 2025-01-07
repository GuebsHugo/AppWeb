INSERT INTO User (last_name, first_name, email, phone, address, password, authorities)
VALUES
('Smith', 'John', 'john.smith@example.com', '1234567890', '123 Main St, City A', '$2a$10$7eWc9M.XdU0l2EBO5h5Zz5d/M6X8Gn5smSHoEotLmcTZtE9cY6u8S', 'ROLE_USER'),
('Doe', 'Jane', 'jane.doe@example.com', '2345678901', '456 Elm St, City B', '$2a$10$zUEu6d4MIJl7o6Oa3Pj5dExOmyU6ndUgcC9dw6nV1zV6YngEvh5iC', 'ROLE_USER,ROLE_ADMIN'),
('Brown', 'Charlie', 'charlie.brown@example.com', '3456789012', '789 Oak St, City C', '$2a$10$DzcMjUy3fREYS3PS7n2nu.I3l5K.xO3DTYpbkl/0CbnTQXcMyV82S', 'ROLE_USER'),
('Johnson', 'Emily', 'emily.johnson@example.com', '4567890123', '101 Pine St, City D', '$2a$10$NaN9tzMZnKgV9o4UgZOlQxa9Xh1MLXeqIK26FlSEKkInHZOn6v6zq', 'ROLE_USER,ROLE_ADMIN'),
('Miller', 'Michael', 'michael.miller@example.com', '5678901234', '202 Maple St, City E', '$2a$10$JnbkbTh3uGlfV79jL9lgC7q9x4bfr.QptqlY0z6lvhwXEdjqYBoNW', 'ROLE_USER');


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
