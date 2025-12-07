SELECT Location, SUM(Capacity) AS Total_Capacity, AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM Warehouses GROUP BY Location;
