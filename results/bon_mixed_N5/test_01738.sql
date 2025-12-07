SELECT Location, SUM(Capacity) AS total_capacity, AVG(Capacity) AS average_capacity, MAX(Capacity) AS maximum_capacity FROM Warehouses GROUP BY Location;
