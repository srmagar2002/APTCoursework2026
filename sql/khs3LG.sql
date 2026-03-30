CREATE
DATABASE IF NOT EXISTS KHS3LG;
USE
KHS3LG;

DROP TABLE IF EXISTS LAPTOP;


CREATE TABLE laptop
(
/*BASIC INFO*/
    laptopID INT AUTO_INCREMENT PRIMARY KEY,
    brand    VARCHAR(200) NOT NULL,
    model    VARCHAR(200) NOT NULL,
    title    TEXT NOT NULL,
    description TEXT ,
    imgUrl TEXT,
    thumbnailUrl TEXT,

/*SPECS*/
    processor VARCHAR(200) NOT NULL,
    ram VARCHAR(200) NOT NULL,
    storage VARCHAR(200) NOT NULL,
    storageType VARCHAR(200) NOT NULL,
    graphicsCard VARCHAR(200) NOT NULL,
    screenSize DECIMAL(10,2) NOT NULL,
    resolution VARCHAR(200) NOT NULL,
    operatingSystem VARCHAR(200) NOT NULL DEFAULT 'Windows',

 /*PRICING*/
    price DECIMAL(10,2) NOT NULL,
    discount INT ,
    stockQuantity INT,
    availabilityStatus VARCHAR(200) GENERATED  ALWAYS AS(
        CASE
            WHEN stockQuantity<1 THEN 'OUT OF STOCK'
        ELSE 'IN STOCK'
        END
) STORED,


/*OTHER*/
    weight INT,
    color VARCHAR(200),
    batteryLife INT,

/*METADATA*/
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

CONSTRAINT storageCheck CHECK(storageType IN ('SSD','HDD')),
CONSTRAINT osCheck CHECK(operatingSystem IN ('Windows','MacOS','Linux')),
CONSTRAINT availabilityCheck CHECK(availabilityStatus IN('IN STOCK','OUT OF STOCK'))
)

