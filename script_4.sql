#e. Window Functions:
#i. Row_Number with Subclause Order By:
SELECT StoreName, Revenue,
       ROW_NUMBER() OVER (ORDER BY Revenue DESC) AS RankRevenue
FROM SalesData;

##########
#ii. LAG and LEAD with Subclause Order By and Partition By:
-- Calculate the difference in revenue from the previous and next years for each store, partitioned by StoreID
SELECT StoreName, Year, Revenue,
       LAG(Revenue) OVER (PARTITION BY StoreName ORDER BY Year) AS PrevYearRevenue,
       LEAD(Revenue) OVER (PARTITION BY StoreName ORDER BY Year) AS NextYearRevenue
FROM SalesData;

#############
##iii. FIRST_VALUE and LAST_VALUE with Subclause Order By:
-- Retrieve the first and last revenue values for each store, ordered by Year
SELECT StoreName, Year, Revenue,
       FIRST_VALUE(Revenue) OVER (PARTITION BY StoreName ORDER BY Year) AS FirstYearRevenue,
       LAST_VALUE(Revenue) OVER (PARTITION BY StoreName ORDER BY Year) AS LastYearRevenue
FROM SalesData;

##############

#iv. Ranking Functions: Row_Number(), Rank(), and Dense_Rank():
-- Assign ranks with and without gaps for stores based on revenue
SELECT StoreName, Year, Revenue,
	   Row_Number() OVER (PARTITION BY StoreName ORDER BY Revenue DESC) AS RowN,
       RANK() OVER (PARTITION BY StoreName ORDER BY Revenue DESC) AS RankN,
       DENSE_RANK() OVER (PARTITION BY StoreName ORDER BY Revenue DESC) AS DenseRank
FROM SalesData;

select * from SalesData;

########

#v. NTILEs (Market Segmentation):
SELECT
    StoreName,
    Revenue,
    NTILE(3) OVER (ORDER BY Revenue) AS Tile
FROM
    SalesData;



##########
#vi. Aggregate Functions as Window Functions:

#1. SUM() for Cumulative Sum 
-- Calculate the cumulative revenue for each store over the years
SELECT StoreName, Year, Revenue,
       SUM(Revenue) OVER (PARTITION BY StoreName ORDER BY Year) AS CumulativeRevenue
FROM SalesData;

###########
-- Calculate the maximum revenue for each store within each year and within the last 2 years
SELECT StoreName, Year, Revenue,
       MAX(Revenue) OVER (PARTITION BY StoreName ORDER BY Year) AS MaxRevenueInYear,
       MAX(Revenue) OVER (PARTITION BY StoreName ORDER BY Year ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS MaxRevenueLast2Years
FROM SalesData;

############

-- Calculate the 2-year moving average of quantity sold in sales and include a column with Range between preceding and current row
SELECT StoreName, Year, Quantity,
       AVG(Quantity) OVER (PARTITION BY StoreName ORDER BY Year ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS TwoYearMovingAvg
FROM SalesData;


