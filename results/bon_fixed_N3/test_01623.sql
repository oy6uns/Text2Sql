SELECT Make, COUNT(*) AS Number_of_Drivers
FROM driver
GROUP BY Make;
