SELECT Make, COUNT(*) AS count
FROM driver
WHERE TRY_TO_NUMBER(Points) > 150
GROUP BY Make;
