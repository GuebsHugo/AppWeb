INSERT INTO User (last_name, first_name, email, phone, address, password, authorities)
VALUES
('Smith', 'John', 'john.smith@example.com', '1234567890', '123 Main St, City A', '$2a$10$7eWc9M.XdU0l2EBO5h5Zz5d/M6X8Gn5smSHoEotLmcTZtE9cY6u8S', 'ROLE_USER'),
('Doe', 'Jane', 'jane.doe@example.com', '2345678901', '456 Elm St, City B', '$2a$10$zUEu6d4MIJl7o6Oa3Pj5dExOmyU6ndUgcC9dw6nV1zV6YngEvh5iC', 'ROLE_USER,ROLE_ADMIN'),
('Brown', 'Charlie', 'charlie.brown@example.com', '3456789012', '789 Oak St, City C', '$2a$10$DzcMjUy3fREYS3PS7n2nu.I3l5K.xO3DTYpbkl/0CbnTQXcMyV82S', 'ROLE_USER'),
('Johnson', 'Emily', 'emily.johnson@example.com', '4567890123', '101 Pine St, City D', '$2a$10$NaN9tzMZnKgV9o4UgZOlQxa9Xh1MLXeqIK26FlSEKkInHZOn6v6zq', 'ROLE_USER,ROLE_ADMIN'),
('Miller', 'Michael', 'michael.miller@example.com', '5678901234', '202 Maple St, City E', '$2a$10$JnbkbTh3uGlfV79jL9lgC7q9x4bfr.QptqlY0z6lvhwXEdjqYBoNW', 'ROLE_USER');

INSERT INTO Category (name, description)
VALUES
('Vapes', 'Cigarette Electronique'),
('Gouts', 'Aromes du gout de la vape'),
('Accessoires', 'Accessoires pour vapes');

INSERT INTO Product (label, description, price, stock, category_id)
VALUES
('GEEKVAPE S100 Aegis Solo', '100W BOX MOD Vape with Z Subohm 2021 Tank 5.5ml Z Coil Vaporizer Electronic Cigarette', 149.99, 14, 1),
('XROS 3 Mini Kit | Original Vaporesso XROS 3 Mini', 'Kit Built in 1000mAh Battery Vape with 2ml XROS Pod Cartridge MTL to RDL Electronic Cigarette Vaporizer No Nicotine, Compact, Rose', 18.80, 88, 1),
('VAPTIO Tyro Nano Kit', 'Cigarette électronique 900mAh 30W Kit de démarrage Vape Pen tout-en-un, Sans e liquide sans nicotine (Gris argent)', 13.99, 203, 1),
('l''Effarant', 'CRAZY LABZ by Belgi''Ohm - l''Effarant- 50ml Tout le savoir-faire de Crazy Labz by Belgi''Ohm, conforme à la nouvelle TPD BELGE 2023 Saveur: fruits rouges, myrtille, bonbon, Frais', 19.99, 156, 2),
('l''Urluberlu', 'CRAZY LABZ by Belgi''Ohm - l''Urluberlu- 50ml Tout le savoir-faire de Crazy Labz by Belgi''Ohm, conforme à la nouvelle TPD BELGE 2023 Saveur: fraise, mangue, grenade, Frais', 19.99, 99, 2),
('l''Ahurissant', 'CRAZY LABZ by Belgi''Ohm - l''Ahurissant- 50ml Tout le savoir-faire de Crazy Labz by Belgi''Ohm, conforme à la nouvelle TPD BELGE 2023 Saveur: champagne, raisin, Frais', 19.99, 150, 2),
('la Divagation', 'CRAZY LABZ by Belgi''Ohm - la Divagation- 50ml Tout le savoir-faire de Crazy Labz by Belgi''Ohm, conforme à la nouvelle TPD BELGE 2023 Saveur: fruit du serpent-mûre noire-cassis-myrtille-Frais', 19.99, 82, 2),
('Puffs +9000', 'Vape cigarette électronique Led RandM Tornado sans nicotine', 13.50, 34, 1),
('Rechargeable Lithium Battery', 'Battery 3.6V 18650 VTC6 3000mAh', 30.50, 34, 3),
('IMREN 18650 Rechargeable Battery Charger', 'Quick Battery Charger for 3.7V 18650 14500 14650 17500 18350 18650 18700 20700 21700 22650 26650, 1.2V Ni-MH/Ni-MH/1.2 V Ni-Cd AA Battery AAA C (4 bays)', 15.50, 4, 3),
('Le Booster Belge VDLV', 'e-liquide pour cigarette électronique Recharges d''eliquide étiquetées selon les dispositions de l''article 48 du règlement n°1272/2008 Danger : respecter les précautions d''emploi Supérieur à 16,6 mg/ml : H301. Toxique en cas d''ingestion (catégorie 3)', 2.50, 26, 3);

INSERT INTO CustomerOrder (user_id, total, status)
VALUES
(1, 699.99, 'PAID'),
(2, 19.99, 'PENDING'),
(3, 14.99, 'PAID'),
(4, 399.99, 'PAID'),
(5, 29.99, 'PENDING');

INSERT INTO OrderLine (order_id, product_id, quantity, unit_price)
VALUES
(1, 6, 2, 19.99),
(2, 7, 1, 19.99),
(3, 8, 1, 19.99),
(4, 9, 1, 13.50),
(5, 10, 1, 30.50);
