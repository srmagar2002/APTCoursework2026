USE KHS3LG;

INSERT IGNORE INTO users (username,email,password_hash,role) VALUES ('admin'
        ,'admin@admin.com','$2a$10$quyPeY7N5RQHlf/MlQ947equUsDswgunEHrcaKy2j67B7ejWl7nXq','ADMIN');
/*password:APTadmin&123*/

INSERT INTO laptop (
    laptopUUID,brand, model, title, description,category,
    processor, ram, storage, storageType, graphicsCard, screenSize, resolution, operatingSystem,
    price, discount, stockQuantity,
    weight, color, batteryLife
) VALUES
      (UUID(),'Dell', 'XPS 13', 'Dell XPS 13 2026', 'Compact high-end laptop','Gaming',
       'Intel i7-1365U', '16GB', '512GB', 'SSD', 'Intel Iris Xe', '16.2 Liquid Retina XDR', '1920x1200', 'Windows',
       1499.99, 10, 25, 1200, 'Silver', 12),

      (UUID(),'Apple', 'MacBook Air M2', 'Apple MacBook Air M2', 'Lightweight Apple laptop with M2 chip','Ultrabook',
       'Apple M2', '16GB', '256GB', 'SSD', 'Integrated', '16.2 Liquid Retina XDR', '2560x1664', 'MacOS',
       1299.99, 5, 15  , 1300, 'Space Gray', 15),

      (UUID(),'HP', 'Spectre x360', 'HP Spectre x360 Convertible', '2-in-1 laptop with touchscreen', 'Business',
       'Intel i7-1255U', '16GB', '1TB', 'SSD', 'Intel Iris Xe', '16.2 Liquid Retina XDR', '1920x1080', 'Windows',
       1599.99, 0, 10  , 1400, 'Black', 10),

      (UUID(),'Lenovo', 'ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 11', 'Business ultrabook with great keyboard','Student',
       'Intel i7-1260P', '16GB', '512GB', 'SSD', 'Intel Iris Xe', '16.2 Liquid Retina XDR', '2560x1600', 'Windows',
       1899.99, 15, 8  , 1200, 'Black', 14),

      (UUID(),'Asus', 'ROG Zephyrus G14', 'Asus Gaming Laptop', 'Portable gaming laptop with Ryzen CPU','Convertible',
       'AMD Ryzen 9 7940HS', '32GB', '1TB', 'SSD', 'NVIDIA RTX 4060', '16.2 Liquid Retina XDR', '2560x1600', 'Windows',
       2199.99, 20, 5  , 1500, 'White', 9),

      (UUID(),'Acer', 'Swift 3', 'Acer Swift 3 Lightweight Laptop', 'Budget-friendly ultrabook','Workstation',
       'Intel i5-1235U', '8GB', '512GB', 'SSD', 'Intel Iris Xe', '16.2 Liquid Retina XDR', '1920x1080', 'Windows',
       749.99, 0, 30  , 1250, 'Silver', 11),

      (UUID(),'MSI', 'GF63 Thin', 'MSI GF63 Thin Gaming Laptop', 'Affordable gaming laptop','General',
       'Intel i7-11800H', '16GB', '512GB', 'SSD', 'NVIDIA GTX 1650', '16.2 Liquid Retina XDR', '1920x1080', 'Windows',
       1099.99, 10, 12  , 1800, 'Black', 8),

      (UUID(),'Dell', 'Inspiron 15', 'Dell Inspiron 15 Laptop', 'All-purpose laptop', 'Workstation',
       'Intel i5-1240P', '8GB', '1TB', 'HDD', 'Intel Iris Xe', '16.2 Liquid Retina XDR', '1920x1080', 'Windows',
       649.99, 0, 20  , 2000, 'Blue', 7),

      (UUID(),'HP', 'Pavilion 14', 'HP Pavilion 14', 'Everyday laptop for students','Gaming',
       'Intel i3-1215U', '8GB', '256GB', 'SSD', 'Intel UHD', '16.2 Liquid Retina XDR', '1920x1080', 'Windows',
       499.99, 5, 18  , 1350, 'Silver', 10),

      (UUID(),'Apple', 'MacBook Pro 16', 'Apple MacBook Pro 16 M2 Pro', 'High-end laptop for creators', 'Business',
       'Apple M2 Pro', '32GB', '1TB', 'SSD', 'Integrated', 16.2, '3456x2234', 'MacOS',
       2699.99, 10, 7  , 2200, 'Silver', 17);


INSERT INTO cart (userId, laptopId, quantity) VALUES (1, 1, 1);
INSERT INTO cart (userId, laptopId, quantity) VALUES (1, 2, 2);
INSERT INTO cart (userId, laptopId, quantity) VALUES (2, 1, 1);
INSERT INTO cart (userId, laptopId, quantity) VALUES (2, 3, 3);
INSERT INTO cart (userId, laptopId, quantity) VALUES (3, 4, 1);
