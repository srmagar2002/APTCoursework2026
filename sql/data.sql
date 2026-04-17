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
      (UUID(),'Dell','XPS 15','Dell XPS 15 2026','Premium performance laptop','Ultrabook',
       'Intel i7-13700H','16GB','1TB','SSD','NVIDIA RTX 4050','15.6','2560x1600','Windows',
       1899.99,8,20,1800,'Silver',10),

      (UUID(),'Dell','XPS 17','Dell XPS 17 2026','High-end large display laptop','Ultrabook',
       'Intel i9-13900H','32GB','1TB','SSD','NVIDIA RTX 4060','17','3840x2400','Windows',
       2499.99,5,15,2200,'Black',9),

      (UUID(),'Dell','Inspiron 15','Dell Inspiron 15','Affordable everyday laptop','General',
       'Intel i5-1335U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       799.99,12,40,1900,'Blue',8),

      (UUID(),'Dell','Inspiron 14','Dell Inspiron 14','Portable budget laptop','General',
       'Intel i5-1235U','8GB','256GB','SSD','Intel UHD','14','1920x1080','Windows',
       649.99,15,50,1600,'Silver',9),

      (UUID(),'Dell','Alienware M16','Dell Alienware M16','High performance gaming laptop','Gaming',
       'Intel i9-13900HX','32GB','2TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2999.99,7,10,2800,'Black',6),

      (UUID(),'Dell','Alienware X14','Dell Alienware X14','Slim gaming laptop','Gaming',
       'Intel i7-13700H','16GB','1TB','SSD','NVIDIA RTX 4060','14','2560x1440','Windows',
       2199.99,6,12,1900,'White',7),

      (UUID(),'Dell','Latitude 7440','Dell Latitude 7440','Business class laptop','Business',
       'Intel i7-1365U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1599.99,10,30,1400,'Gray',13),

      (UUID(),'Dell','Latitude 5540','Dell Latitude 5540','Reliable office laptop','Business',
       'Intel i5-1345U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       1199.99,9,35,1700,'Black',11),

      (UUID(),'Dell','Vostro 3520','Dell Vostro 3520','Small business laptop','Business',
       'Intel i5-1235U','8GB','512GB','SSD','Intel UHD','15.6','1920x1080','Windows',
       899.99,11,45,1800,'Gray',10),

      (UUID(),'Dell','G15 5530','Dell G15 Gaming Laptop','Mid-range gaming laptop','Gaming',
       'Intel i7-13650HX','16GB','1TB','SSD','NVIDIA RTX 4050','15.6','1920x1080','Windows',
       1399.99,10,22,2500,'Black',7),

      (UUID(),'Apple','MacBook Air M2','MacBook Air 13 M2','Lightweight and efficient laptop','Ultrabook',
       'Apple M2','8GB','256GB','SSD','Integrated 8-core GPU','13.6','2560x1664','macOS',
       1199.99,5,30,1240,'Silver',18),

      (UUID(),'Apple','MacBook Air M3','MacBook Air 13 M3','Latest generation Air with M3 chip','Ultrabook',
       'Apple M3','8GB','512GB','SSD','Integrated 10-core GPU','13.6','2560x1664','macOS',
       1399.99,4,25,1240,'Starlight',20),

      (UUID(),'Apple','MacBook Air 15 M2','MacBook Air 15 M2','Larger display ultra-thin laptop','Ultrabook',
       'Apple M2','16GB','512GB','SSD','Integrated 10-core GPU','15.3','2880x1864','macOS',
       1599.99,6,20,1480,'Midnight',18),

      (UUID(),'Apple','MacBook Air 15 M3','MacBook Air 15 M3','Powerful and portable large Air','Ultrabook',
       'Apple M3','16GB','512GB','SSD','Integrated 10-core GPU','15.3','2880x1864','macOS',
       1699.99,5,18,1480,'Space Gray',20),

      (UUID(),'Apple','MacBook Pro 13 M2','MacBook Pro 13-inch M2','Compact pro performance','Professional',
       'Apple M2','8GB','512GB','SSD','Integrated 10-core GPU','13.3','2560x1600','macOS',
       1499.99,7,22,1400,'Space Gray',20),

      (UUID(),'Apple','MacBook Pro 14 M3','MacBook Pro 14 M3','High-performance professional laptop','Professional',
       'Apple M3 Pro','18GB','512GB','SSD','Integrated 14-core GPU','14.2','3024x1964','macOS',
       1999.99,5,15,1600,'Silver',18),

      (UUID(),'Apple','MacBook Pro 14 M3 Max','MacBook Pro 14 M3 Max','Extreme performance laptop','Professional',
       'Apple M3 Max','36GB','1TB','SSD','Integrated 30-core GPU','14.2','3024x1964','macOS',
       2999.99,3,10,1620,'Space Black',16),

      (UUID(),'Apple','MacBook Pro 16 M3 Pro','MacBook Pro 16 M3 Pro','Large display pro laptop','Professional',
       'Apple M3 Pro','18GB','512GB','SSD','Integrated 18-core GPU','16.2','3456x2234','macOS',
       2499.99,4,12,2100,'Silver',20),

      (UUID(),'Apple','MacBook Pro 16 M3 Max','MacBook Pro 16 M3 Max','Ultimate power for professionals','Professional',
       'Apple M3 Max','48GB','1TB','SSD','Integrated 40-core GPU','16.2','3456x2234','macOS',
       3499.99,2,8,2150,'Space Black',18),

      (UUID(),'Apple','MacBook Pro 13 M1','MacBook Pro 13-inch M1','Reliable and efficient older model','Professional',
       'Apple M1','8GB','256GB','SSD','Integrated 8-core GPU','13.3','2560x1600','macOS',
       1099.99,10,35,1400,'Silver',20),

      (UUID(),'Acer','Aspire 5','Acer Aspire 5','Affordable everyday laptop','General',
       'Intel i5-1335U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       699.99,12,40,1800,'Silver',8),

      (UUID(),'Acer','Aspire 7','Acer Aspire 7','Entry-level performance laptop','General',
       'Intel i7-12650H','16GB','512GB','SSD','NVIDIA GTX 1650','15.6','1920x1080','Windows',
       999.99,10,30,2100,'Black',7),

      (UUID(),'Acer','Swift 3','Acer Swift 3','Slim and lightweight ultrabook','Ultrabook',
       'Intel i7-1360P','16GB','512GB','SSD','Intel Iris Xe','14','2560x1600','Windows',
       1099.99,8,25,1250,'Blue',12),

      (UUID(),'Acer','Swift X','Acer Swift X','Portable laptop with dedicated GPU','Ultrabook',
       'AMD Ryzen 7 7840U','16GB','1TB','SSD','NVIDIA RTX 3050','14','1920x1080','Windows',
       1299.99,7,20,1400,'Gray',10),

      (UUID(),'Acer','Predator Helios 16','Acer Predator Helios 16','High-end gaming laptop','Gaming',
       'Intel i9-13900HX','32GB','1TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2799.99,6,10,2900,'Black',6),

      (UUID(),'Acer','Nitro 5','Acer Nitro 5','Budget gaming laptop','Gaming',
       'Intel i7-12700H','16GB','512GB','SSD','NVIDIA RTX 4060','15.6','1920x1080','Windows',
       1299.99,9,28,2500,'Black',7),

      (UUID(),'Acer','Nitro 16','Acer Nitro 16','Mid-range gaming performance','Gaming',
       'AMD Ryzen 7 7840HS','16GB','1TB','SSD','NVIDIA RTX 4070','16','2560x1600','Windows',
       1699.99,8,18,2700,'Black',6),

      (UUID(),'Acer','TravelMate P4','Acer TravelMate P4','Business laptop for professionals','Business',
       'Intel i5-1345U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1199.99,10,22,1350,'Gray',13),

      (UUID(),'Acer','Chromebook Spin 714','Acer Chromebook Spin 714','Convertible Chromebook','General',
       'Intel i5-1335U','8GB','256GB','SSD','Intel Iris Xe','14','1920x1200','Chrome OS',
       749.99,11,26,1500,'Silver',12),

      (UUID(),'Acer','Aspire Vero','Acer Aspire Vero','Eco-friendly sustainable laptop','General',
       'Intel i5-1235U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       799.99,10,24,1750,'Green',9),

      (UUID(),'HP','Pavilion 15','HP Pavilion 15','Reliable everyday performance','General',
       'Intel i5-1335U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       749.99,10,35,1800,'Silver',8),

      (UUID(),'HP','Pavilion 14','HP Pavilion 14','Compact and portable laptop','Student',
       'Intel i5-1235U','8GB','512GB','SSD','Intel Iris Xe','14','1920x1080','Windows',
       699.99,12,40,1500,'Blue',9),

      (UUID(),'HP','Envy x360','HP Envy x360','Convertible premium laptop','Convertible',
       'AMD Ryzen 7 7730U','16GB','512GB','SSD','AMD Radeon Graphics','15.6','1920x1080','Windows',
       1099.99,8,25,1900,'Black',11),

      (UUID(),'HP','Envy 16','HP Envy 16','High-performance sleek laptop','Ultrabook',
       'Intel i7-13700H','16GB','1TB','SSD','NVIDIA RTX 4060','16','2560x1600','Windows',
       1599.99,7,20,2100,'Silver',10),

      (UUID(),'HP','Spectre x360 14','HP Spectre x360 14','Premium convertible ultrabook','Convertible',
       'Intel i7-1355U','16GB','1TB','SSD','Intel Iris Xe','13.5','3000x2000','Windows',
       1699.99,6,15,1400,'Gold',13),

      (UUID(),'HP','EliteBook 840','HP EliteBook 840 G10','Business-class secure laptop','Business',
       'Intel i7-1365U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1499.99,9,30,1350,'Silver',14),

      (UUID(),'HP','ProBook 450','HP ProBook 450 G10','Office productivity laptop','Business',
       'Intel i5-1345U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       1199.99,10,28,1700,'Gray',12),

      (UUID(),'HP','Omen 16','HP Omen 16','High-end gaming laptop','Gaming',
       'Intel i7-13700HX','16GB','1TB','SSD','NVIDIA RTX 4070','16.1','2560x1440','Windows',
       1799.99,8,18,2600,'Black',7),

      (UUID(),'HP','Victus 15','HP Victus 15','Affordable gaming laptop','Gaming',
       'Intel i5-13420H','16GB','512GB','SSD','NVIDIA RTX 4050','15.6','1920x1080','Windows',
       1099.99,11,22,2400,'Blue',7),

      (UUID(),'HP','ZBook Power','HP ZBook Power G10','Mobile workstation laptop','Workstation',
       'Intel i9-13900H','32GB','1TB','SSD','NVIDIA RTX A2000','15.6','1920x1080','Windows',
       2299.99,5,12,2200,'Silver',9),

      (UUID(),'ASUS','ROG Strix G16','ASUS ROG Strix G16','High-performance gaming laptop','Gaming',
       'Intel i7-13650HX','16GB','1TB','SSD','NVIDIA RTX 4060','16','1920x1200','Windows',
       1599.99,8,20,2500,'Black',7),

      (UUID(),'ASUS','ROG Strix G18','ASUS ROG Strix G18','Large display gaming powerhouse','Gaming',
       'Intel i9-13980HX','32GB','1TB','SSD','NVIDIA RTX 4080','18','2560x1600','Windows',
       2499.99,6,12,3100,'Black',6),

      (UUID(),'ASUS','ROG Zephyrus G14','ASUS ROG Zephyrus G14','Compact premium gaming laptop','Gaming',
       'AMD Ryzen 9 7940HS','16GB','1TB','SSD','NVIDIA RTX 4070','14','2560x1600','Windows',
       1999.99,7,15,1650,'White',8),

      (UUID(),'ASUS','ROG Zephyrus G16','ASUS ROG Zephyrus G16','Slim and powerful gaming laptop','Gaming',
       'Intel i9-13900H','32GB','1TB','SSD','NVIDIA RTX 4070','16','2560x1600','Windows',
       2199.99,5,14,2100,'Gray',7),

      (UUID(),'ASUS','ROG Zephyrus M16','ASUS ROG Zephyrus M16','High-end slim gaming laptop','Gaming',
       'Intel i9-13900H','32GB','2TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2699.99,4,10,2200,'Black',6),

      (UUID(),'ASUS','ROG Flow X13','ASUS ROG Flow X13','Convertible gaming laptop','Convertible',
       'AMD Ryzen 9 7940HS','16GB','1TB','SSD','NVIDIA RTX 4050','13.4','1920x1200','Windows',
       1799.99,6,18,1300,'Black',9),

      (UUID(),'ASUS','ROG Flow Z13','ASUS ROG Flow Z13','Detachable gaming tablet laptop','Convertible',
       'Intel i9-13900H','16GB','1TB','SSD','NVIDIA RTX 4060','13.4','2560x1600','Windows',
       1899.99,5,16,1200,'Black',8),

      (UUID(),'ASUS','ROG Strix Scar 16','ASUS ROG Strix Scar 16','Premium competitive gaming laptop','Gaming',
       'Intel i9-13980HX','32GB','2TB','SSD','NVIDIA RTX 4090','16','2560x1600','Windows',
       3299.99,3,8,2800,'Black',6),

      (UUID(),'ASUS','ROG Strix Scar 18','ASUS ROG Strix Scar 18','Ultimate large gaming laptop','Gaming',
       'Intel i9-13980HX','64GB','2TB','SSD','NVIDIA RTX 4090','18','2560x1600','Windows',
       3799.99,2,6,3200,'Black',5),

      (UUID(),'ASUS','ROG Zephyrus Duo 16','ASUS ROG Zephyrus Duo 16','Dual-screen gaming laptop','Gaming',
       'AMD Ryzen 9 7945HX','32GB','2TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2999.99,4,9,2600,'Black',6),

      (UUID(),'Lenovo','ThinkPad X1 Carbon','Lenovo ThinkPad X1 Carbon Gen 11','Premium business ultrabook','Business',
       'Intel i7-1365U','16GB','1TB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1899.99,7,20,1120,'Black',15),

      (UUID(),'Lenovo','ThinkPad T14','Lenovo ThinkPad T14 Gen 4','Reliable business laptop','Business',
       'Intel i5-1345U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1399.99,9,25,1450,'Black',14),

      (UUID(),'Lenovo','ThinkPad E15','Lenovo ThinkPad E15','Affordable business laptop','Business',
       'Intel i5-1235U','8GB','512GB','SSD','Intel UHD','15.6','1920x1080','Windows',
       999.99,11,30,1700,'Black',12),

      (UUID(),'Lenovo','IdeaPad Slim 5','Lenovo IdeaPad Slim 5','Slim everyday performance laptop','General',
       'AMD Ryzen 7 7730U','16GB','512GB','SSD','AMD Radeon Graphics','15.6','1920x1080','Windows',
       849.99,10,35,1600,'Gray',11),

      (UUID(),'Lenovo','IdeaPad 3','Lenovo IdeaPad 3','Budget-friendly student laptop','Student',
       'Intel i3-1215U','8GB','256GB','SSD','Intel UHD','15.6','1920x1080','Windows',
       549.99,15,40,1750,'Blue',9),

      (UUID(),'Lenovo','Yoga 7i','Lenovo Yoga 7i','Convertible premium ultrabook','Convertible',
       'Intel i7-1355U','16GB','1TB','SSD','Intel Iris Xe','14','2880x1800','Windows',
       1299.99,8,22,1400,'Silver',13),

      (UUID(),'Lenovo','Yoga 9i','Lenovo Yoga 9i','High-end convertible laptop','Convertible',
       'Intel i7-1360P','16GB','1TB','SSD','Intel Iris Xe','14','2880x1800','Windows',
       1599.99,6,18,1350,'Gray',14),

      (UUID(),'Lenovo','Legion 5','Lenovo Legion 5','Mid-range gaming laptop','Gaming',
       'AMD Ryzen 7 7840HS','16GB','1TB','SSD','NVIDIA RTX 4060','15.6','2560x1440','Windows',
       1499.99,9,20,2500,'Black',7),

      (UUID(),'Lenovo','Legion 7','Lenovo Legion 7','High-performance gaming laptop','Gaming',
       'Intel i9-13900HX','32GB','1TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2499.99,5,12,2700,'Black',6),

      (UUID(),'Lenovo','ThinkPad P16','Lenovo ThinkPad P16','Mobile workstation laptop','Workstation',
       'Intel i9-13950HX','32GB','1TB','SSD','NVIDIA RTX A3000','16','1920x1200','Windows',
       2799.99,4,10,2900,'Black',8);