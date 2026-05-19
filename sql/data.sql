USE
KHS3LG;

/* admin */
INSERT
IGNORE INTO users (username,email,password_hash,role) VALUES ('admin'
        ,'admin@admin.com','$2a$10$quyPeY7N5RQHlf/MlQ947equUsDswgunEHrcaKy2j67B7ejWl7nXq','ADMIN');
/*password:APTadmin&123*/

/* customers */
INSERT
IGNORE INTO users (username,email,password_hash,role,profileImg) VALUES
       ('sugam','sugam@sugam.com','$2a$10$jegFIlpCS74MO/mB25e9nulmuAj6chcLnQ764sHR7sfKZd6/PmTW2' /*Sugam&123*/,'CUSTOMER','userImg/2.gif'),
       ('heaven','heaven@heaven.com','$2a$10$lOk71gYCTkRFKE29aG604OkuhWAZC579NuvOCpbIj9gFTogsvSCjq' /*Heaven&123*/,'CUSTOMER','userImg/3.jpg'),
       ('kushal','kushal@kushal.com','$2a$10$WRY2N7z77ruGR7JX8POeTe3gvsGrs5Dp582fr6ZXVhkPOn8VxUmGW' /*Kushal&123*/,'CUSTOMER','userDefaultimg/default0.png'),
       ('paras','paras@paras.com','$2a$10$6IReMXxVy84EOiYzOBNH5OasR8dMUvzPVKPcP/Tcc66QPQl.aZYXC'/*Paras&123*/,'CUSTOMER','userImg/5.jpg'),
       ('suzan','suzan@suzan.com','$2a$10$cxgcPQEt6w.QoHa1whbVDu.WEg5b8sJ2LMSIeWXPjh1HicJJvtudy' /*Suzan&123*/,'CUSTOMER','userDefaultimg/default0.png'),
       ('sangam','sangam@sangam.com','$2a$10$cMoHlU259yfNhbxrQgkPuOj3tK1PvAojNVbKizjtosCuy5nPBENl2' /*Sangam&123*/,'CUSTOMER','userDefaultimg/default0.png');

INSERT
IGNORE INTO laptop (
    laptopUUID,brand, model, title, description,category,
    processor, ram, storage, storageType, graphicsCard, screenSize, resolution, operatingSystem,
    price, discount, stockQuantity,
    weight, color, batteryLife
) VALUES
      (UUID(),'Dell','XPS 15','Dell XPS 15 2026','The Dell XPS 15 2026 is a premium ultrabook designed for high performance and sleek portability. Powered by an Intel i7-13700H processor and NVIDIA RTX 4050 graphics, it handles demanding tasks effortlessly. Its 15.6-inch 2560x1600 display delivers sharp visuals, while the 1TB SSD ensures fast storage and responsiveness.','Ultrabook',
       'Intel i7-13700H','16GB','1TB','SSD','NVIDIA RTX 4050','15.6','2560x1600','Windows',
       1899.99,8,20,1800,'Silver',10),

      (UUID(),'Dell','XPS 17','Dell XPS 17 2026','The Dell XPS 17 2026 is a high-end ultrabook built for power users who need a large, immersive display. Featuring an Intel i9-13900H processor, 32GB RAM, and NVIDIA RTX 4060 graphics, it delivers exceptional performance. Its 17-inch 4K display ensures stunning clarity, while the 1TB SSD provides fast and reliable storage.','Ultrabook',
       'Intel i9-13900H','32GB','1TB','SSD','NVIDIA RTX 4060','17','3840x2400','Windows',
       2499.99,5,15,2200,'Black',9),

      (UUID(),'Dell','Inspiron 15','Dell Inspiron 15','The Dell Inspiron 15 is an affordable and reliable laptop designed for everyday use. Powered by an Intel i5-1335U processor with 8GB RAM, it handles daily tasks smoothly. The 15.6-inch Full HD display offers clear visuals, while the 512GB SSD ensures quick boot times and efficient storage.','General',
       'Intel i5-1335U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       799.99,12,40,1900,'Blue',8),

      (UUID(),'Dell','Inspiron 14','Dell Inspiron 14','The Dell Inspiron 14 is a compact and budget-friendly laptop ideal for users on the go. Equipped with an Intel i5-1235U processor and 8GB RAM, it handles everyday tasks efficiently. Its 14-inch Full HD display offers clear visuals, while the 256GB SSD provides fast performance and essential storage.','General',
       'Intel i5-1235U','8GB','256GB','SSD','Intel UHD','14','1920x1080','Windows',
       649.99,15,50,1600,'Silver',9),

      (UUID(),'Dell','Alienware M16','Dell Alienware M16','The Dell Alienware M16 is a powerful gaming laptop built for extreme performance and immersive gameplay. Featuring an Intel i9-13900HX processor, 32GB RAM, and NVIDIA RTX 4080 graphics, it handles the latest AAA titles with ease. Its 16-inch high-resolution display and 2TB SSD deliver stunning visuals and massive, fast storage.','Gaming',
       'Intel i9-13900HX','32GB','2TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2999.99,7,10,2800,'Black',6),

      (UUID(),'Dell','Alienware X14','Dell Alienware X14','The Dell Alienware X14 is a slim and portable gaming laptop designed for performance on the go. Powered by an Intel i7-13700H processor, 16GB RAM, and NVIDIA RTX 4060 graphics, it delivers smooth gameplay. Its 14-inch high-resolution display and 1TB SSD ensure fast performance and vibrant visuals.','Gaming',
       'Intel i7-13700H','16GB','1TB','SSD','NVIDIA RTX 4060','14','2560x1440','Windows',
       2199.99,6,12,1900,'White',7),

      (UUID(),'Dell','Latitude 7440','Dell Latitude 7440','The Dell Latitude 7440 is a business-class laptop designed for productivity and reliability. Powered by an Intel i7-1365U processor with 16GB RAM, it ensures smooth multitasking and efficient performance. Its 14-inch Full HD+ display offers clear visuals, while the 512GB SSD provides fast and secure storage for professional use.','Business',
       'Intel i7-1365U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1599.99,10,30,1400,'Gray',13),

      (UUID(),'Dell','Latitude 5540','Dell Latitude 5540','The Dell Latitude 5540 is a reliable office laptop built for everyday business tasks. Featuring an Intel i5-1345U processor and 8GB RAM, it delivers consistent performance for productivity. Its 15.6-inch Full HD display ensures clear visuals, while the 512GB SSD offers fast storage and quick system responsiveness.','Business',
       'Intel i5-1345U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       1199.99,9,35,1700,'Black',11),

      (UUID(),'Dell','Vostro 3520','Dell Vostro 3520','The Dell Vostro 3520 is a practical laptop designed for small business users and daily office tasks. Powered by an Intel i5-1235U processor and 8GB RAM, it delivers reliable performance. Its 15.6-inch Full HD display ensures clear visuals, while the 512GB SSD provides fast storage and smooth system operation.','Business',
       'Intel i5-1235U','8GB','512GB','SSD','Intel UHD','15.6','1920x1080','Windows',
       899.99,11,45,1800,'Gray',10),

      (UUID(),'Dell','G15 5530','Dell G15 Gaming Laptop','The Dell G15 5530 is a mid-range gaming laptop designed for smooth and responsive gameplay. Powered by an Intel i7-13650HX processor, 16GB RAM, and NVIDIA RTX 4050 graphics, it handles modern games with ease. Its 15.6-inch Full HD display and 1TB SSD deliver fast performance and immersive visuals.','Gaming',
       'Intel i7-13650HX','16GB','1TB','SSD','NVIDIA RTX 4050','15.6','1920x1080','Windows',
       1399.99,10,22,2500,'Black',7),

      (UUID(),'Apple','MacBook Air M2','MacBook Air 13 M2','The MacBook Air M2 is a lightweight and highly efficient ultrabook designed for everyday productivity and portability. Powered by Apple’s M2 chip with an integrated 8-core GPU, it delivers smooth performance and excellent battery life. Its 13.6-inch high-resolution display offers vibrant visuals, while the fast SSD ensures quick responsiveness and reliable storage.','Ultrabook',
       'Apple M2','8GB','256GB','SSD','Integrated 8-core GPU','13.6','2560x1664','macOS',
       1199.99,5,30,1240,'Silver',18),

      (UUID(),'Apple','MacBook Air M3','MacBook Air 13 M3','The MacBook Air M3 is Apple’s latest lightweight ultrabook, powered by the efficient M3 chip with a 10-core integrated GPU. It delivers fast, silent performance ideal for everyday productivity and creative tasks. With a 13.6-inch high-resolution display and 512GB SSD, it offers vibrant visuals, smooth multitasking, and ample storage in a sleek, portable design.','Ultrabook',
       'Apple M3','8GB','512GB','SSD','Integrated 10-core GPU','13.6','2560x1664','macOS',
       1399.99,4,25,1240,'Starlight',20),

      (UUID(),'Apple','MacBook Air 15 M2','MacBook Air 15 M2','The MacBook Air 15 M2 is a thin and lightweight ultrabook featuring a larger 15.3-inch Liquid Retina display for enhanced viewing comfort. Powered by Apple’s M2 chip with a 10-core GPU and 16GB RAM, it delivers smooth multitasking and strong performance. Its 512GB SSD ensures fast storage, making it ideal for productivity and creative work on the go.','Ultrabook',
       'Apple M2','16GB','512GB','SSD','Integrated 10-core GPU','15.3','2880x1864','macOS',
       1599.99,6,20,1480,'Midnight',18),

      (UUID(),'Apple','MacBook Air 15 M3','MacBook Air 15 M3','The MacBook Air 15 M3 combines power and portability in a sleek large-screen ultrabook. Powered by Apple’s M3 chip with a 10-core GPU and 16GB RAM, it delivers fast, efficient performance for demanding everyday tasks. Its 15.3-inch Liquid Retina display offers sharp, vibrant visuals, while the 512GB SSD ensures smooth, responsive storage access.','Ultrabook',
       'Apple M3','16GB','512GB','SSD','Integrated 10-core GPU','15.3','2880x1864','macOS',
       1699.99,5,18,1480,'Space Gray',20),

      (UUID(),'Apple','MacBook Pro 13 M2','MacBook Pro 13-inch M2','The MacBook Pro 13-inch M2 is a compact professional laptop designed for strong performance and efficiency. Powered by Apple’s M2 chip with a 10-core GPU and 8GB RAM, it handles demanding workloads smoothly. Its 13.3-inch Retina display delivers sharp visuals, while the 512GB SSD ensures fast storage and responsive performance for creative and professional tasks.','Professional',
       'Apple M2','8GB','512GB','SSD','Integrated 10-core GPU','13.3','2560x1600','macOS',
       1499.99,7,22,1400,'Space Gray',20),

      (UUID(),'Apple','MacBook Pro 14 M3','MacBook Pro 14 M3','The MacBook Pro 14 M3 is a high-performance professional laptop built for demanding creative and technical workloads. Powered by the Apple M3 Pro chip with an integrated 14-core GPU and 18GB RAM, it delivers exceptional speed and efficiency. Its 14.2-inch Liquid Retina XDR display offers stunning clarity, while the 512GB SSD ensures fast, reliable storage performance.','Professional',
       'Apple M3 Pro','18GB','512GB','SSD','Integrated 14-core GPU','14.2','3024x1964','macOS',
       1999.99,5,15,1600,'Silver',18),

      (UUID(),'Apple','MacBook Pro 14 M3 Max','MacBook Pro 14 M3 Max','The MacBook Pro 14 M3 Max is an extreme-performance professional laptop built for the most demanding workflows. Powered by the Apple M3 Max chip with a 30-core integrated GPU and 36GB RAM, it delivers outstanding speed for rendering, development, and AI tasks. Its 14.2-inch Liquid Retina XDR display and 1TB SSD ensure exceptional visuals and ultra-fast storage performance.','Professional',
       'Apple M3 Max','36GB','1TB','SSD','Integrated 30-core GPU','14.2','3024x1964','macOS',
       2999.99,3,10,1620,'Space Black',16),

      (UUID(),'Apple','MacBook Pro 16 M3 Pro','MacBook Pro 16 M3 Pro','The MacBook Pro 16 M3 Pro is a large-screen professional laptop designed for high-end productivity and creative workflows. Powered by the Apple M3 Pro chip with an 18-core integrated GPU and 18GB RAM, it delivers strong, efficient performance. Its 16.2-inch Liquid Retina XDR display offers stunning detail, while the 512GB SSD ensures fast and reliable storage access.','Professional',
       'Apple M3 Pro','18GB','512GB','SSD','Integrated 18-core GPU','16.2','3456x2234','macOS',
       2499.99,4,12,2100,'Silver',20),

      (UUID(),'Apple','MacBook Pro 16 M3 Max','MacBook Pro 16 M3 Max','The MacBook Pro 16 M3 Max is the ultimate professional laptop, engineered for extreme performance and heavy workloads. Powered by the Apple M3 Max chip with a 40-core integrated GPU and 48GB RAM, it delivers unmatched speed for 3D rendering, video production, and advanced computing. Its 16.2-inch Liquid Retina XDR display and 1TB SSD ensure stunning visuals and ultra-fast, reliable storage performance.','Professional',
       'Apple M3 Max','48GB','1TB','SSD','Integrated 40-core GPU','16.2','3456x2234','macOS',
       3499.99,2,8,2150,'Space Black',18),

      (UUID(),'Apple','MacBook Pro 13 M1','MacBook Pro 13-inch M1','The MacBook Pro 13-inch M1 is a reliable and efficient professional laptop designed for smooth everyday performance. Powered by Apple’s M1 chip with an 8-core integrated GPU and 8GB RAM, it handles productivity and creative tasks with ease. Its 13.3-inch Retina display delivers sharp visuals, while the 256GB SSD ensures fast boot times and responsive storage.','Professional',
       'Apple M1','8GB','256GB','SSD','Integrated 8-core GPU','13.3','2560x1600','macOS',
       1099.99,10,35,1400,'Silver',20),

      (UUID(),'Acer','Aspire 5','Acer Aspire 5','The Acer Aspire 5 is an affordable everyday laptop designed for smooth and reliable performance. Powered by an Intel i5-1335U processor with 8GB RAM, it handles daily tasks like browsing, office work, and media consumption efficiently. Its 15.6-inch Full HD display offers clear visuals, while the 512GB SSD ensures fast boot times and responsive storage.','General',
       'Intel i5-1335U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       699.99,12,40,1800,'Silver',8),

      (UUID(),'Acer','Aspire 7','Acer Aspire 7','The Acer Aspire 7 is a versatile entry-level performance laptop designed for everyday productivity and light gaming. Powered by an Intel i7-12650H processor, 16GB RAM, and fast 512GB SSD storage, it ensures smooth multitasking. Its 15.6-inch Full HD display and GTX 1650 graphics deliver solid visual performance in a sleek black design.','General',
       'Intel i7-12650H','16GB','512GB','SSD','NVIDIA GTX 1650','15.6','1920x1080','Windows',
       999.99,10,30,2100,'Black',7),

      (UUID(),'Acer','Swift 3','Acer Swift 3','The Acer Swift 3 is a slim, lightweight ultrabook built for portability and performance. Featuring an Intel i7-1360P processor, 16GB RAM, and 512GB SSD, it handles multitasking with ease. Its 14-inch 2560×1600 display offers crisp visuals, while Intel Iris Xe graphics ensure smooth everyday performance in a stylish blue finish.','Ultrabook',
       'Intel i7-1360P','16GB','512GB','SSD','Intel Iris Xe','14','2560x1600','Windows',
       1099.99,8,25,1250,'Blue',12),

      (UUID(),'Acer','Swift X','Acer Swift X','The Acer Swift X is a portable ultrabook that blends power and mobility with ease. Equipped with an AMD Ryzen 7 7840U, 16GB RAM, and a spacious 1TB SSD, it delivers fast performance. The 14-inch Full HD display and RTX 3050 graphics make it great for creative work and light gaming.','Ultrabook',
       'AMD Ryzen 7 7840U','16GB','1TB','SSD','NVIDIA RTX 3050','14','1920x1080','Windows',
       1299.99,7,20,1400,'Gray',10),

      (UUID(),'Acer','Predator Helios 16','Acer Predator Helios 16','The Acer Predator Helios 16 is a high-end gaming laptop built for serious performance. Powered by an Intel i9-13900HX, 32GB RAM, and a 1TB SSD, it handles demanding tasks effortlessly. Its 16-inch 2560×1600 display and RTX 4080 graphics deliver stunning visuals and ultra-smooth gameplay in a bold black design.','Gaming',
       'Intel i9-13900HX','32GB','1TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2799.99,6,10,2900,'Black',6),

      (UUID(),'Acer','Nitro 5','Acer Nitro 5','The Acer Nitro 5 is a budget-friendly gaming laptop that balances performance and value. It features an Intel i7-12700H processor, 16GB RAM, and a fast 512GB SSD for smooth gameplay and multitasking. With RTX 4060 graphics and a 15.6-inch Full HD display, it delivers an immersive gaming experience.','Gaming',
       'Intel i7-12700H','16GB','512GB','SSD','NVIDIA RTX 4060','15.6','1920x1080','Windows',
       1299.99,9,28,2500,'Black',7),

      (UUID(),'Acer','Nitro 16','Acer Nitro 16','The Acer Nitro 16 is a mid-range gaming laptop designed for strong, reliable performance. Powered by an AMD Ryzen 7 7840HS, 16GB RAM, and a 1TB SSD, it handles modern games and multitasking smoothly. Its 16-inch 2560×1600 display and RTX 4070 graphics deliver sharp visuals and immersive gameplay.','Gaming',
       'AMD Ryzen 7 7840HS','16GB','1TB','SSD','NVIDIA RTX 4070','16','2560x1600','Windows',
       1699.99,8,18,2700,'Black',6),

      (UUID(),'Acer','TravelMate P4','Acer TravelMate P4','The Acer TravelMate P4 is a reliable business laptop built for professionals on the move. Powered by an Intel i5-1345U, 16GB RAM, and a 512GB SSD, it ensures smooth productivity. Its 14-inch 1920×1200 display and durable, lightweight design make it ideal for everyday office tasks.','Business',
       'Intel i5-1345U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1199.99,10,22,1350,'Gray',13),

      (UUID(),'Acer','Chromebook Spin 714','Acer Chromebook Spin 714','The Acer Chromebook Spin 714 is a versatile convertible laptop designed for everyday flexibility. Powered by an Intel i5-1335U, 8GB RAM, and 256GB SSD, it handles daily tasks smoothly. Its 14-inch 1920×1200 touchscreen and 2-in-1 design make it perfect for work, study, and entertainment.','General',
       'Intel i5-1335U','8GB','256GB','SSD','Intel Iris Xe','14','1920x1200','Chrome OS',
       749.99,11,26,1500,'Silver',12),

      (UUID(),'Acer','Aspire Vero','Acer Aspire Vero','The Acer Aspire Vero is an eco-friendly laptop designed with sustainability in mind. Powered by an Intel i5-1235U, 8GB RAM, and a 512GB SSD, it delivers reliable everyday performance. Its 15.6-inch Full HD display and thoughtfully crafted design make it ideal for conscious, modern users.','General',
       'Intel i5-1235U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       799.99,10,24,1750,'Green',9),

      (UUID(),'HP','Pavilion 15','HP Pavilion 15','The HP Pavilion 15 is a reliable everyday laptop built for smooth performance and productivity. Equipped with an Intel i5-1335U processor, 8GB RAM, and a 512GB SSD, it handles daily tasks with ease. Its 15.6-inch Full HD display delivers clear visuals in a sleek silver design.','General',
       'Intel i5-1335U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       749.99,10,35,1800,'Silver',8),

      (UUID(),'HP','Pavilion 14','HP Pavilion 14','The HP Pavilion 14 is a compact and portable laptop designed for students and everyday use. Powered by an Intel i5-1235U, 8GB RAM, and a 512GB SSD, it ensures smooth multitasking and fast performance. Its 14-inch Full HD display and lightweight design make it ideal for studying on the go.','Student',
       'Intel i5-1235U','8GB','512GB','SSD','Intel Iris Xe','14','1920x1080','Windows',
       699.99,12,40,1500,'Blue',9),

      (UUID(),'HP','Envy x360','HP Envy x360','The HP Envy x360 is a premium convertible laptop designed for flexibility and performance. Powered by an AMD Ryzen 7 7730U, 16GB RAM, and a 512GB SSD, it delivers smooth multitasking. Its 15.6-inch Full HD touchscreen and 2-in-1 design make it ideal for work, creativity, and entertainment.','Convertible',
       'AMD Ryzen 7 7730U','16GB','512GB','SSD','AMD Radeon Graphics','15.6','1920x1080','Windows',
       1099.99,8,25,1900,'Black',11),

      (UUID(),'HP','Envy 16','HP Envy 16','The HP Envy 16 is a sleek high-performance ultrabook built for power users and creators. Featuring an Intel i7-13700H, 16GB RAM, and a 1TB SSD, it delivers fast and efficient performance. Its 16-inch 2560×1600 display and RTX 4060 graphics provide sharp visuals for work, design, and entertainment.','Ultrabook',
       'Intel i7-13700H','16GB','1TB','SSD','NVIDIA RTX 4060','16','2560x1600','Windows',
       1599.99,7,20,2100,'Silver',10),

      (UUID(),'HP','Spectre x360 14','HP Spectre x360 14','The HP Spectre x360 14 is a premium convertible ultrabook that combines elegance with strong performance. Powered by an Intel i7-1355U, 16GB RAM, and a 1TB SSD, it ensures smooth multitasking. Its 13.5-inch 3K2K touchscreen delivers stunning clarity, making it ideal for productivity, creativity, and entertainment.','Convertible',
       'Intel i7-1355U','16GB','1TB','SSD','Intel Iris Xe','13.5','3000x2000','Windows',
       1699.99,6,15,1400,'Gold',13),

      (UUID(),'HP','EliteBook 840','HP EliteBook 840 G10','The HP EliteBook 840 G10 is a business-class laptop built for security, reliability, and productivity. Powered by an Intel i7-1365U, 16GB RAM, and a 512GB SSD, it delivers smooth professional performance. Its 14-inch 1920×1200 display and sleek silver design make it ideal for modern workplace demands.','Business',
       'Intel i7-1365U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1499.99,9,30,1350,'Silver',14),

      (UUID(),'HP','ProBook 450','HP ProBook 450 G10','The HP ProBook 450 G10 is a dependable office productivity laptop designed for business users. Powered by an Intel i5-1345U, 8GB RAM, and a 512GB SSD, it ensures smooth everyday performance. Its 15.6-inch Full HD display and durable gray design make it ideal for professional work environments.','Business',
       'Intel i5-1345U','8GB','512GB','SSD','Intel Iris Xe','15.6','1920x1080','Windows',
       1199.99,10,28,1700,'Gray',12),

      (UUID(),'HP','Omen 16','HP Omen 16','The HP Omen 16 is a high-end gaming laptop built for powerful and immersive performance. Equipped with an Intel i7-13700HX, 16GB RAM, and a 1TB SSD, it handles demanding games with ease. Its 16.1-inch 2560×1440 display and RTX 4070 graphics deliver sharp visuals and smooth gameplay in a sleek black design.','Gaming',
       'Intel i7-13700HX','16GB','1TB','SSD','NVIDIA RTX 4070','16.1','2560x1440','Windows',
       1799.99,8,18,2600,'Black',7),

      (UUID(),'HP','Victus 15','HP Victus 15','The HP Victus 15 is an affordable gaming laptop designed for smooth everyday performance and casual gaming. Powered by an Intel i5-13420H, 16GB RAM, and a 512GB SSD, it ensures responsive multitasking. Its 15.6-inch Full HD display and RTX 4050 graphics deliver solid visuals in a modern blue design.','Gaming',
       'Intel i5-13420H','16GB','512GB','SSD','NVIDIA RTX 4050','15.6','1920x1080','Windows',
       1099.99,11,22,2400,'Blue',7),

      (UUID(),'HP','ZBook Power','HP ZBook Power G10','The HP ZBook Power G10 is a mobile workstation built for demanding professional workloads. Powered by an Intel i9-13900H, 32GB RAM, and a 1TB SSD, it delivers exceptional performance for heavy multitasking. Its 15.6-inch Full HD display and RTX A2000 graphics make it ideal for design, engineering, and content creation.','Workstation',
       'Intel i9-13900H','32GB','1TB','SSD','NVIDIA RTX A2000','15.6','1920x1080','Windows',
       2299.99,5,12,2200,'Silver',9),

      (UUID(),'ASUS','ROG Strix G16','ASUS ROG Strix G16','The ASUS ROG Strix G16 is a high-performance gaming laptop designed for smooth and immersive gameplay. Powered by an Intel i7-13650HX, 16GB RAM, and a 1TB SSD, it delivers fast and responsive performance. Its 16-inch 1920×1200 display and RTX 4060 graphics ensure sharp visuals and fluid gaming in a bold black design.','Gaming',
       'Intel i7-13650HX','16GB','1TB','SSD','NVIDIA RTX 4060','16','1920x1200','Windows',
       1599.99,8,20,2500,'Black',7),

      (UUID(),'ASUS','ROG Strix G18','ASUS ROG Strix G18','The ASUS ROG Strix G18 is a powerful gaming laptop built for top-tier performance and immersive visuals. Equipped with an Intel i9-13980HX, 32GB RAM, and a 1TB SSD, it handles demanding games effortlessly. Its 18-inch 2560×1600 display and RTX 4080 graphics deliver stunning detail and ultra-smooth gameplay.','Gaming',
       'Intel i9-13980HX','32GB','1TB','SSD','NVIDIA RTX 4080','18','2560x1600','Windows',
       2499.99,6,12,3100,'Black',6),

      (UUID(),'ASUS','ROG Zephyrus G14','ASUS ROG Zephyrus G14','The ASUS ROG Zephyrus G14 is a compact premium gaming laptop that balances power and portability. Featuring an AMD Ryzen 9 7940HS, 16GB RAM, and a 1TB SSD, it delivers excellent performance for gaming and creative tasks. Its 14-inch 2560×1600 display and RTX 4070 graphics ensure sharp visuals and smooth gameplay.','Gaming',
       'AMD Ryzen 9 7940HS','16GB','1TB','SSD','NVIDIA RTX 4070','14','2560x1600','Windows',
       1999.99,7,15,1650,'White',8),

      (UUID(),'ASUS','ROG Zephyrus G16','ASUS ROG Zephyrus G16','The ASUS ROG Zephyrus G16 is a slim yet powerful gaming laptop designed for high performance and portability. Powered by an Intel i9-13900H, 32GB RAM, and a 1TB SSD, it handles demanding games and workloads with ease. Its 16-inch 2560×1600 display and RTX 4070 deliver smooth, vibrant visuals.','Gaming',
       'Intel i9-13900H','32GB','1TB','SSD','NVIDIA RTX 4070','16','2560x1600','Windows',
       2199.99,5,14,2100,'Gray',7),

      (UUID(),'ASUS','ROG Zephyrus M16','ASUS ROG Zephyrus M16','The ASUS ROG Zephyrus M16 is a high-end slim gaming laptop built for serious performance and portability. Powered by an Intel i9-13900H, 32GB RAM, and a massive 2TB SSD, it handles heavy workloads with ease. Its 16-inch 2560×1600 display and RTX 4080 deliver stunning visuals and ultra-smooth gaming.','Gaming',
       'Intel i9-13900H','32GB','2TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2699.99,4,10,2200,'Black',6),

      (UUID(),'ASUS','ROG Flow X13','ASUS ROG Flow X13','The ASUS ROG Flow X13 is a versatile convertible gaming laptop that combines portability with strong performance. Powered by an AMD Ryzen 9 7940HS, 16GB RAM, and a 1TB SSD, it ensures smooth multitasking and gaming. Its 13.4-inch 1920×1200 touchscreen and RTX 4050 graphics make it ideal for both work and play.','Convertible',
       'AMD Ryzen 9 7940HS','16GB','1TB','SSD','NVIDIA RTX 4050','13.4','1920x1200','Windows',
       1799.99,6,18,1300,'Black',9),

      (UUID(),'ASUS','ROG Flow Z13','ASUS ROG Flow Z13','The ASUS ROG Flow Z13 is a unique detachable gaming tablet laptop designed for extreme versatility. Powered by an Intel i9-13900H, 16GB RAM, and a 1TB SSD, it delivers strong performance in a compact form. Its 13.4-inch 2560×1600 display and RTX 4060 graphics ensure sharp visuals and smooth gaming anywhere.','Convertible',
       'Intel i9-13900H','16GB','1TB','SSD','NVIDIA RTX 4060','13.4','2560x1600','Windows',
       1899.99,5,16,1200,'Black',8),

      (UUID(),'ASUS','ROG Strix Scar 16','ASUS ROG Strix Scar 16','The ASUS ROG Strix Scar 16 is a premium competitive gaming laptop built for extreme performance. Powered by an Intel i9-13980HX, 32GB RAM, and a 2TB SSD, it delivers unmatched speed and responsiveness. Its 16-inch 2560×1600 display and RTX 4090 graphics provide top-tier visuals for intense, high-FPS gaming.','Gaming',
       'Intel i9-13980HX','32GB','2TB','SSD','NVIDIA RTX 4090','16','2560x1600','Windows',
       3299.99,3,8,2800,'Black',6),

      (UUID(),'ASUS','ROG Strix Scar 18','ASUS ROG Strix Scar 18','The ASUS ROG Strix Scar 18 is the ultimate large-format gaming laptop built for extreme performance. Powered by an Intel i9-13980HX, 64GB RAM, and a 2TB SSD, it handles the most demanding workloads with ease. Its 18-inch 2560×1600 display and RTX 4090 deliver breathtaking visuals and elite-level gaming power.','Gaming',
       'Intel i9-13980HX','64GB','2TB','SSD','NVIDIA RTX 4090','18','2560x1600','Windows',
       3799.99,2,6,3200,'Black',5),

      (UUID(),'ASUS','ROG Zephyrus Duo 16','ASUS ROG Zephyrus Duo 16','The ASUS ROG Zephyrus Duo 16 is a cutting-edge dual-screen gaming laptop built for creators and gamers. Powered by an AMD Ryzen 9 7945HX, 32GB RAM, and a 2TB SSD, it delivers exceptional performance. Its 16-inch 2560×1600 display, RTX 4080 graphics, and secondary screen enhance multitasking and immersive gameplay.','Gaming',
       'AMD Ryzen 9 7945HX','32GB','2TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2999.99,4,9,2600,'Black',6),

      (UUID(),'Lenovo','ThinkPad X1 Carbon','Lenovo ThinkPad X1 Carbon Gen 11','The Lenovo ThinkPad X1 Carbon Gen 11 is a premium business ultrabook designed for professionals who value portability and performance. Powered by an Intel i7-1365U, 16GB RAM, and a 1TB SSD, it ensures smooth multitasking. Its 14-inch 1920×1200 display and lightweight black design make it ideal for productivity on the go.','Business',
       'Intel i7-1365U','16GB','1TB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1899.99,7,20,1120,'Black',15),

      (UUID(),'Lenovo','ThinkPad T14','Lenovo ThinkPad T14 Gen 4','The Lenovo ThinkPad T14 Gen 4 is a reliable business laptop built for productivity and durability. Powered by an Intel i5-1345U, 16GB RAM, and a 512GB SSD, it delivers consistent performance for everyday office tasks. Its 14-inch 1920×1200 display and classic black ThinkPad design make it ideal for professionals.','Business',
       'Intel i5-1345U','16GB','512GB','SSD','Intel Iris Xe','14','1920x1200','Windows',
       1399.99,9,25,1450,'Black',14),

      (UUID(),'Lenovo','ThinkPad E15','Lenovo ThinkPad E15','The Lenovo ThinkPad E15 is an affordable business laptop designed for reliable everyday productivity. Powered by an Intel i5-1235U, 8GB RAM, and a 512GB SSD, it handles office tasks efficiently. Its 15.6-inch Full HD display and durable black ThinkPad design make it a practical choice for professionals.','Business',
       'Intel i5-1235U','8GB','512GB','SSD','Intel UHD','15.6','1920x1080','Windows',
       999.99,11,30,1700,'Black',12),

      (UUID(),'Lenovo','IdeaPad Slim 5','Lenovo IdeaPad Slim 5','The Lenovo IdeaPad Slim 5 is a sleek everyday performance laptop designed for smooth multitasking and portability. Powered by an AMD Ryzen 7 7730U, 16GB RAM, and a 512GB SSD, it delivers fast and efficient performance. Its 15.6-inch Full HD display and slim gray design make it ideal for daily use.','General',
       'AMD Ryzen 7 7730U','16GB','512GB','SSD','AMD Radeon Graphics','15.6','1920x1080','Windows',
       849.99,10,35,1600,'Gray',11),

      (UUID(),'Lenovo','IdeaPad 3','Lenovo IdeaPad 3','The Lenovo IdeaPad 3 is a budget-friendly student laptop designed for basic everyday computing. Powered by an Intel i3-1215U, 8GB RAM, and a 256GB SSD, it handles web browsing, study tasks, and office work smoothly. Its 15.6-inch Full HD display and simple blue design make it practical and easy to use.','Student',
       'Intel i3-1215U','8GB','256GB','SSD','Intel UHD','15.6','1920x1080','Windows',
       549.99,15,40,1750,'Blue',9),

      (UUID(),'Lenovo','Yoga 7i','Lenovo Yoga 7i','The Lenovo Yoga 7i is a premium convertible ultrabook designed for flexibility and performance. Powered by an Intel i7-1355U, 16GB RAM, and a 1TB SSD, it delivers smooth multitasking. Its 14-inch 2880×1800 touchscreen and 2-in-1 design make it perfect for productivity, creativity, and entertainment.','Convertible',
       'Intel i7-1355U','16GB','1TB','SSD','Intel Iris Xe','14','2880x1800','Windows',
       1299.99,8,22,1400,'Silver',13),

      (UUID(),'Lenovo','Yoga 9i','Lenovo Yoga 9i','The Lenovo Yoga 9i is a high-end convertible laptop that blends premium design with strong performance. Powered by an Intel i7-1360P, 16GB RAM, and a 1TB SSD, it ensures smooth and responsive multitasking. Its 14-inch 2880×1800 touchscreen and sleek 2-in-1 build make it ideal for work, creativity, and entertainment.','Convertible',
       'Intel i7-1360P','16GB','1TB','SSD','Intel Iris Xe','14','2880x1800','Windows',
       1599.99,6,18,1350,'Gray',14),

      (UUID(),'Lenovo','Legion 5','Lenovo Legion 5','The Lenovo Legion 5 is a mid-range gaming laptop designed for strong and reliable performance. Powered by an AMD Ryzen 7 7840HS, 16GB RAM, and a 1TB SSD, it delivers smooth multitasking and fast load times. Its 15.6-inch 2560×1440 display and RTX 4060 graphics provide sharp visuals and immersive gameplay.','Gaming',
       'AMD Ryzen 7 7840HS','16GB','1TB','SSD','NVIDIA RTX 4060','15.6','2560x1440','Windows',
       1499.99,9,20,2500,'Black',7),

      (UUID(),'Lenovo','Legion 7','Lenovo Legion 7','The Lenovo Legion 7 is a high-performance gaming laptop built for demanding players and creators. Powered by an Intel i9-13900HX, 32GB RAM, and a 1TB SSD, it delivers exceptional speed and responsiveness. Its 16-inch 2560×1600 display and RTX 4080 graphics ensure stunning visuals and smooth, immersive gameplay.','Gaming',
       'Intel i9-13900HX','32GB','1TB','SSD','NVIDIA RTX 4080','16','2560x1600','Windows',
       2499.99,5,12,2700,'Black',6),

      (UUID(),'Lenovo','ThinkPad P16','Lenovo ThinkPad P16','The Lenovo ThinkPad P16 is a powerful mobile workstation designed for professionals handling demanding workloads. Equipped with an Intel i9-13950HX, 32GB RAM, and a 1TB SSD, it delivers exceptional performance and reliability. Its 16-inch 1920×1200 display and RTX A3000 graphics make it ideal for engineering, design, and advanced creative tasks.','Workstation',
       'Intel i9-13950HX','32GB','1TB','SSD','NVIDIA RTX A3000','16','1920x1200','Windows',
       2799.99,4,10,2900,'Black',8);


INSERT
IGNORE INTO rating (userID, laptopID, rating, review)
VALUES (2, 1, 5, 'Excellent performance'),
       (2, 2, 4, 'Very good laptop'),
       (2, 3, 3, 'Average experience'),

       (3, 1, 4, 'Good but pricey'),
       (3, 4, 5, 'Loved it'),
       (3, 5, 2, 'Not worth it'),

       (4, 2, 3, 'Decent overall'),
       (4, 3, 4, 'Pretty solid'),
       (4, 6, 5, 'Amazing device'),

       (5, 1, 2, 'Battery is weak'),
       (5, 7, 4, 'Good for work'),
       (5, 8, 5, 'Fantastic'),

       (6, 2, 1, 'Terrible experience'),
       (6, 9, 3, 'Okayish'),
       (6, 10, 4, 'Nice build quality'),

       (7, 3, 5, 'Best laptop ever'),
       (7, 4, 4, 'Very reliable'),
       (7, 5, 3, 'Average'),
       (7, 6, 2, 'Could be better'),
       (7, 7, 4, 'Good value'),
       (2, 4, 5, 'Super fast and smooth'),
       (2, 5, 3, 'Okay performance'),

       (3, 2, 4, 'Good for daily use'),
       (3, 6, 2, 'Not impressed'),

       (4, 1, 5, 'Excellent build quality'),
       (4, 7, 4, 'Very reliable machine'),

       (5, 2, 3, 'Average battery life'),
       (5, 3, 5, 'Amazing display'),

       (6, 1, 4, 'Solid choice'),
       (6, 4, 2, 'Too slow for my needs'),

       (7, 1, 5, 'Perfect laptop'),
       (7, 2, 4, 'Great value for money'),

       (2, 6, 3, 'Decent but noisy fan'),
       (3, 7, 5, 'Outstanding performance'),

       (4, 8, 4, 'Nice design'),
       (5, 9, 2, 'Disappointing experience'),

       (6, 8, 5, 'Very powerful'),
       (7, 9, 3, 'Average specs'),

       (2, 7, 4, 'Good portability'),
       (3, 8, 5, 'Excellent for students');




-- Dummy Data to get visuals
INSERT IGNORE INTO cart (userId, laptopId, quantity)
VALUES (2, 1, 1);
INSERT IGNORE INTO cart (userId, laptopId, quantity)
VALUES (2, 2, 2);
INSERT IGNORE INTO cart (userId, laptopId, quantity)
VALUES (2, 3, 1);

INSERT IGNORE INTO orders (userId, totalAmount, status, estimatedDelivery, createdAt)
VALUES (1, 6267.80, 'DELIVERED', DATE_ADD(NOW(), INTERVAL 5 DAY), NOW());
INSERT IGNORE INTO orders (userId, totalAmount, status, estimatedDelivery, createdAt)
VALUES (1, 1649.00, 'OUT_FOR_DELIVERY', DATE_ADD('2026-04-28', INTERVAL 5 DAY), '2026-04-28 10:00:00');
-- Orders
INSERT IGNORE INTO orders (userId, totalAmount, status, estimatedDelivery)
VALUES (1, 1299.99, 'SHIPPED', '2026-05-25 14:00:00'),
       (2, 899.50, 'SHIPPED', '2026-05-22 10:30:00'),
       (3, 1599.00, 'IN_TRANSIT', '2026-05-18 16:00:00'),
       (1, 749.99, 'PREPARING', '2026-05-28 12:00:00'),
       (4, 2199.99, 'PREPARING', '2026-05-30 18:00:00'),
       (5, 499.99, 'PREPARING', '2026-05-17 09:00:00'),
       (2, 1349.49, 'PREPARING', '2026-05-24 15:45:00'),
       (6, 1799.89, 'DELIVERED', '2026-05-29 11:15:00'),
       (3, 999.00, 'DELIVERED', '2026-05-16 13:00:00'),
       (7, 2499.99, 'DELIVERED', '2026-06-01 17:30:00');


-- Order Items
INSERT IGNORE INTO order_items (orderId, laptopId, quantity, price)
VALUES (1, 1, 1, 1299.99),
       (2, 2, 1, 899.50),
       (3, 3, 1, 1599.00),
       (4, 4, 1, 749.99),
       (5, 5, 1, 2199.99),
       (6, 2, 1, 499.99),
       (7, 6, 1, 1349.49),
       (8, 7, 1, 1799.89),
       (9, 3, 1, 999.00),
       (10, 8, 1, 2499.99);


INSERT IGNORE INTO order_items (orderId, laptopId, quantity, price)
VALUES (1, 1, 1, 3499.00);
INSERT IGNORE INTO order_items (orderId, laptopId, quantity, price)
VALUES (1, 2, 1, 2199.00);
INSERT IGNORE INTO order_items (orderId, laptopId, quantity, price)
VALUES (2, 3, 1, 1649.00);

