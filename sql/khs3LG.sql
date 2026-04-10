CREATE
DATABASE IF NOT EXISTS KHS3LG;

USE
KHS3LG;

SET
FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS laptop;
SET
FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users
(
    user_id       INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(50)  NOT NULL UNIQUE,
    email         VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role          VARCHAR(10)  NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT role_const CHECK (role IN ('ADMIN','CUSTOMER'))
);

CREATE TABLE laptop
(
/*BASIC INFO*/
    laptopID           INT AUTO_INCREMENT PRIMARY KEY,
    brand              VARCHAR(200)   NOT NULL,
    model              VARCHAR(200)   NOT NULL,
    title              TEXT           NOT NULL,
    description        TEXT,
    imgUrl             VARCHAR(255) GENERATED ALWAYS AS ( CONCAT('img/', CAST(laptopID AS CHAR), '.jpg')),
    thumbnailUrl       VARCHAR(255) GENERATED ALWAYS AS ( CONCAT('thumb/', CAST(laptopID AS CHAR), '.jpg')),
    category           VARCHAR(200)            DEFAULT 'General',

/*SPECS*/
    processor          VARCHAR(200)   NOT NULL,
    ram                VARCHAR(200)   NOT NULL,
    storage            VARCHAR(200)   NOT NULL,
    storageType        VARCHAR(200)   NOT NULL,
    graphicsCard       VARCHAR(200)   NOT NULL,
    screenSize         DECIMAL(10, 2) NOT NULL,
    resolution         VARCHAR(200)   NOT NULL,
    operatingSystem    VARCHAR(200)   NOT NULL DEFAULT 'Windows',

    /*PRICING*/
    price              DECIMAL(10, 2) NOT NULL,
    discount           INT,
    stockQuantity      INT,
    availabilityStatus VARCHAR(200) GENERATED ALWAYS AS (
        CASE
            WHEN stockQuantity < 1 THEN 'OUT OF STOCK'
            ELSE 'IN STOCK'
            END
        ) STORED,


/*OTHER*/
    weight             INT,
    color              VARCHAR(200),
    batteryLife        INT,

/*METADATA*/
    createdAt          TIMESTAMP               DEFAULT CURRENT_TIMESTAMP,
    updatedAt          TIMESTAMP               DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT categoryCheck CHECK (category IN
                                    ('Gaming', 'Ultrabook', 'Business', 'Student', 'Convertible', 'Workstation',
                                     'General')),
    CONSTRAINT storageCheck CHECK (storageType IN ('SSD', 'HDD')),
    CONSTRAINT osCheck CHECK (operatingSystem IN ('Windows', 'MacOS', 'Linux')),
    CONSTRAINT availabilityCheck CHECK (availabilityStatus IN ('IN STOCK', 'OUT OF STOCK'))
)
/*
Category Explanation
Gaming -	High-performance for gaming
Ultrabook -	Thin & portable laptops
Business -	Enterprise/office laptops
Student -	Affordable, simple laptops
Convertible -	2-in-1 touch laptops
Workstation -	Powerful for professional tasks (CAD, rendering)
General	Default - general-purpose
  */






