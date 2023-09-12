#a. Primary Key:
#ii. Adding Primary Key to Existing Table:

-- Rename the column to "ID"
ALTER TABLE SalesData RENAME COLUMN StoreID TO ID;

-- Make "ID" the primary key
ALTER TABLE SalesData ADD PRIMARY KEY (ID);

DROP TABLE SalesData;
select * from SalesData

###############################
###############################

#b. Surrogate Key:
#i. Adding an Auto-Incrementing Column:
ALTER TABLE SalesData
ADD ID INT AUTO_INCREMENT PRIMARY KEY;

select * from SalesData
DROP TABLE SalesData;

#######

#ii. Combining Two Columns into a New One:
ALTER TABLE SalesData
ADD CombinedColumn VARCHAR(255);

UPDATE SalesData
SET CombinedColumn = CONCAT(StoreID, ProductID);

-- Verify counts
SELECT COUNT(*) AS TotalCount, COUNT(DISTINCT StoreID, ProductID) AS DistinctCount
FROM SalesData;

-- Add constraint as Primary key
ALTER TABLE SalesData
ADD PRIMARY KEY (CombinedColumn);

#########################################
#########################################

#c. Foreign Keys:
#i. Create a Table with Foreign Key:

#ii. Specify Foreign Keys for Existing Table:
ALTER TABLE Orders
ADD CONSTRAINT FK_StoreID
FOREIGN KEY (StoreID) REFERENCES SalesData(ID);

######################

SELECT Orders.OrderID, Orders.StoreID, SalesData.StoreName
FROM Orders
INNER JOIN SalesData ON Orders.StoreID = SalesData.ID
WHERE SalesData.StoreName = 'Store A';

#####################

