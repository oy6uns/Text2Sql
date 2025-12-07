SELECT Constructor, COUNT(DISTINCT Driver_ID) AS Number_of_Drivers
FROM driver
GROUP BY Constructor;
