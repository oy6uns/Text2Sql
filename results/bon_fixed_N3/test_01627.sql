SELECT Make
FROM driver
GROUP BY Make
HAVING COUNT(Driver_ID) >= 3;
