CREATE TABLE SalesRegion (
    SalesRegionID INT PRIMARY KEY,
    SalesRegionName VARCHAR(50) NOT NULL
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE State (
    StateID INT PRIMARY KEY,
    StateName VARCHAR(50) NOT NULL,
    SalesRegionID INT,
    FOREIGN KEY (SalesRegionID) REFERENCES SalesRegion(SalesRegionID)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Sales (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    StateID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (StateID) REFERENCES State(StateID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- TASK 3

INSERT INTO SalesRegion (SalesRegionID, SalesRegionName) 
VALUES (1, 'Europa'), (2, 'America del Nord');

INSERT INTO Category (CategoryID, CategoryName) 
VALUES (1, 'Biciclette'), (2, 'Accessori');

INSERT INTO State (StateID, StateName, SalesRegionID) 
VALUES (1, 'Italia', 1), (2, 'Francia', 1), (3, 'USA', 2);

INSERT INTO Product (ProductID, ProductName, CategoryID) 
VALUES (101, 'Mountain Bike', 1), (102, 'Casco', 2);

INSERT INTO Sales (OrderID, OrderDate, StateID, ProductID, Quantity, UnitPrice) 
VALUES 
(5001, '2023-10-01', 1, 101, 1, 1200.00), -- Vendita in Italia
(5002, '2023-10-05', 2, 102, 2, 50.00);   -- Vendita in Francia
