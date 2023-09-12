-- Creating a Table
CREATE TABLE SalesData (
    StoreID INT,
    ProductID INT,
    Revenue DECIMAL(10, 2),
    Year INT,
    StoreName VARCHAR(255),
    ProductName VARCHAR(255),
    SaleDate DATE,
    Quantity INT,
    Category VARCHAR(50)
    #PRIMARY KEY (StoreID, ProductID)
);

-- Inserting sample data into the SalesData table
INSERT INTO SalesData (StoreID, ProductID, Revenue, Year, StoreName, ProductName, SaleDate, Quantity, Category)
VALUES
    (1, 101, 500.00, 2021, 'Store A', 'Product X', '2021-01-15', 50, 'Electronics'),
    (1, 102, 350.00, 2022, 'Store A', 'Product Y', '2022-02-20', 30, 'Electronics'),
    (2, 101, 600.00, 2021, 'Store B', 'Product X', '2021-03-10', 60, 'Electronics'),
    (2, 103, 200.00, 2022, 'Store B', 'Product Z', '2022-04-05', 20, 'Clothing'),
    (3, 104, 750.00, 2021, 'Store C', 'Product W', '2021-05-12', 75, 'Home'),
    (3, 102, 400.00, 2022, 'Store C', 'Product Y', '2022-06-18', 40, 'Electronics'),
    (4, 105, 300.00, 2019, 'Store D', 'Product V', '2019-07-22', 30, 'Clothing'),
    (4, 105, 200.00, 2020, 'Store D', 'Product V', '2020-07-22', 50, 'Home'),
    (4, 105, 100.00, 2021, 'Store D', 'Product V', '2021-07-22', 90, 'Clothing'),
	(4, 150, 300.00, 2022, 'Store D', 'Product V', '2022-07-22', 50, 'Home');

select * from SalesData;
DROP TABLE SalesData;

################################
-- Creating a second table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    StoreID INT,
    -- Other columns
    FOREIGN KEY (StoreID) REFERENCES SalesData(ID)
);

-- Inserting sample data into the Orders table
INSERT INTO Orders (OrderID, StoreID)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 3),
    (5, 4);

select * from Orders
DROP TABLE Orders;

INSERT INTO Orders (OrderID, StoreID)
VALUES
    (1, 9);

