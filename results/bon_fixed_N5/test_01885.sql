SELECT Name
FROM Client
WHERE AccountNumber IN (
    SELECT Sender
    FROM Package
    GROUP BY Sender
    HAVING COUNT(*) > 1
)
