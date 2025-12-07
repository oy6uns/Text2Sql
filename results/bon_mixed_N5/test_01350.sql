SELECT DISTINCT Constructor
FROM driver
WHERE Constructor IN (
    SELECT Constructor FROM driver WHERE Age < 20
)
AND Constructor IN (
    SELECT Constructor FROM driver WHERE Age > 30
)
