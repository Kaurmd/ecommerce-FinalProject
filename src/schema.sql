DROP TABLE IF EXISTS PurchaseItem;
DROP TABLE IF EXISTS Purchase;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

-- ------------------------------------------------------------
-- CUSTOMER TABLE
-- ------------------------------------------------------------
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- ------------------------------------------------------------
-- PRODUCT TABLE
-- ------------------------------------------------------------
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- ------------------------------------------------------------
-- PURCHASE TABLE
-- ------------------------------------------------------------
CREATE TABLE Purchase (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    PurchaseDate DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- ------------------------------------------------------------
-- PURCHASEITEM
-- ------------------------------------------------------------
CREATE TABLE PurchaseItem (
    purchase_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PurchasePrice DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (purchase_id, product_id),

    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- ============================================================
-- SAMPLE DATA
-- ============================================================

-- ------------------------------------------------------------
-- CUSTOMERS
-- ------------------------------------------------------------
INSERT INTO Customer (name, email) VALUES
('Alex', 'Alex@example.com'),
('John', 'John@example.com'),
('Brad', 'Brad@example.com'),
('Rose', 'Rose@example.com');

-- ------------------------------------------------------------
-- PRODUCT
-- ------------------------------------------------------------
INSERT INTO Product (name, stock_quantity, price) VALUES
('Smartwatch', 30, 199.99),
('Bluetooth Keyboard', 45, 34.99),
('Bluetooth Earphones', 80, 14.99),
('USB-C Cord', 20, 149.99),
('Projector', 15, 229.99),
('Wireless Charger', 70, 19.99),
('Laptop Cooling Pad', 50, 29.99),
('Capture Card', 25, 89.99);

-- ------------------------------------------------------------
-- PURCHASE
-- ------------------------------------------------------------
INSERT INTO Purchase (customer_id, PurchaseDate, total) VALUES
(1, '2026-07-02 12:00:00', 234.98),
(3, '2026-07-04 18:45:00', 49.98),
(4, '2026-07-06 08:30:00', 199.99);

-- ------------------------------------------------------------
-- PURCHASE ITEMS
-- ------------------------------------------------------------
-- Alex
INSERT INTO PurchaseItem VALUES
(1, 5, 1, 229.99),  -- Projector
(1, 7, 1, 29.99);   -- Cooling Pad

-- Brad
INSERT INTO PurchaseItem VALUES
(2, 3, 2, 14.99);   -- Bluetooth Earphones x2

-- Rose
INSERT INTO PurchaseItem VALUES
(3, 1, 1, 199.99);  -- Smartwatch
