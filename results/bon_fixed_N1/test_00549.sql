SELECT Name
FROM Client
WHERE IdClient = (
    SELECT IdClient
    FROM Orders
    GROUP BY IdClient
    ORDER BY COUNT(IdOrder) DESC
    LIMIT 1
)
