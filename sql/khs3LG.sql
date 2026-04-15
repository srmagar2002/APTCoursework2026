CREATE
DATABASE IF NOT EXISTS KHS3LG;

USE
KHS3LG;

SET
FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS users;
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
    CONSTRAINT role_const CHECK (role IN ('ADMIN', 'CUSTOMER'))
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
    img1Url            VARCHAR(255) GENERATED ALWAYS AS ( CONCAT('img1/', CAST(laptopID AS CHAR), '.jpg')),
    img2Url            VARCHAR(255) GENERATED ALWAYS AS ( CONCAT('img2/', CAST(laptopID AS CHAR), '.jpg')),
    thumbnailUrl       VARCHAR(255) GENERATED ALWAYS AS ( CONCAT('thumb/', CAST(laptopID AS CHAR), '.jpg')),
    category           VARCHAR(200)            DEFAULT 'General',

/*SPECS*/
    processor          VARCHAR(200)   NOT NULL,
    ram                VARCHAR(200)   NOT NULL,
    storage            VARCHAR(200)   NOT NULL,
    storageType        VARCHAR(200)   NOT NULL,
    graphicsCard       VARCHAR(200)   NOT NULL,
    screenSize         VARCHAR(200)   NOT NULL,
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


CREATE TABLE cart (

    cart_id      INT PRIMARY KEY AUTO_INCREMENT,
      user_id      INT,
      product_id   INT,
      quantity     INT,
      added_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (user_id)    REFERENCES users(user_id),
      FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (

    order_id       INT PRIMARY KEY AUTO_INCREMENT,
    user_id        INT,
    total_amount   DECIMAL(10, 2),
    order_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status         VARCHAR(50) DEFAULT 'Processing',

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (

     item_id      INT PRIMARY KEY AUTO_INCREMENT,
     order_id     INT,
     product_id   INT,
     quantity     INT,
     price        DECIMAL(10, 2),   -- price at time of purchase

     FOREIGN KEY (order_id)   REFERENCES orders(order_id),
     FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
      payment_id      INT PRIMARY KEY AUTO_INCREMENT,
      order_id        INT,
      user_id         INT,
      amount          DECIMAL(10, 2),
      payment_method  VARCHAR(50),
      payment_status  VARCHAR(50),    --'Success', 'Failed', 'Pending'
      paid_at         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (order_id) REFERENCES orders(order_id),
      FOREIGN KEY (user_id)  REFERENCES users(user_id)
);


CREATE TABLE tracking (
      tracking_id   INT PRIMARY KEY AUTO_INCREMENT,
      order_id      INT,
      status        VARCHAR(100),   -- 'Shipped', 'Out for Delivery', 'Delivered'
      location      VARCHAR(200),
      updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


/*
 Recommendation for changes:


CREATE TABLE products (
    product_id   INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(100),
    brand        VARCHAR(50),
    price        DECIMAL(10,2),
    stock        INT,
    image_url    VARCHAR(255),
    category     VARCHAR(50)    'laptop', 'mouse' 'keyboards' and
);


CREATE TABLE laptop_specs (
    spec_id       INT PRIMARY KEY AUTO_INCREMENT,
    product_id    INT UNIQUE,
    processor     VARCHAR(100),
    ram           VARCHAR(50),
    storage       VARCHAR(100),
    display_size  VARCHAR(20),
    graphics_card VARCHAR(100),
    weight        VARCHAR(20),

    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

 -----WE can add other products specs just like this ---
 mouse_specs, keyboard_specs







 */











