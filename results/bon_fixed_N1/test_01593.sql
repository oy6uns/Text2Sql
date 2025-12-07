SELECT Make, COUNT(*) AS Number_of_Drivers
FROM driver
WHERE TRY_TO_NUMBER(Points) > 150
GROUP BY Make;
