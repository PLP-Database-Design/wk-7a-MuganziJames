-- 1
DROP TABLE IF EXISTS ProductDetail_1NF;

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- 2
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS CustomerOrders;

CREATE TABLE CustomerOrders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES CustomerOrders(OrderID)
);

INSERT INTO CustomerOrders VALUES (101, 'John Doe');
INSERT INTO CustomerOrders VALUES (102, 'Jane Smith');
INSERT INTO CustomerOrders VALUES (103, 'Emily Clark');

INSERT INTO OrderItems VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems VALUES (103, 'Phone', 1);
