SELECT Make, COUNT(*) AS Number_of_Drivers
FROM driver
WHERE CAST(Points AS INTEGER) > 150
GROUP BY Make;
