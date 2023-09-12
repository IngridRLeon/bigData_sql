#d. Subqueries:

#i. Subquery Using WHERE in Statement:
SELECT StoreName, Revenue
FROM SalesData
WHERE Revenue > (SELECT AVG(Revenue) FROM SalesData);

SELECT *
FROM SalesData
WHERE ProductID IN (
    SELECT ProductID
    FROM SalesData
    WHERE Category = 'Electronics'
);

###############
#ii. Subquery Inside SELECT Statement:
SELECT StoreName, Revenue,
       (SELECT MAX(Revenue) FROM SalesData) AS MaxRevenue
FROM SalesData;


##############
#iii. Subqueries Inside FROM:
SELECT StoreName, TotalRevenue
FROM SalesData
JOIN (
    SELECT StoreID, SUM(Revenue) AS TotalRevenue
    FROM SalesData
    GROUP BY StoreID
) AS StoreTotals ON SalesData.ID = StoreTotals.StoreID;





