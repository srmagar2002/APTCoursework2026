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