SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS driver_count
FROM driver
GROUP BY Racing_Series;
