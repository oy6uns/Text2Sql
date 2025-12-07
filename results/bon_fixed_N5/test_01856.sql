SELECT Name
FROM Client
WHERE AccountNumber = (
    SELECT Recipient
    FROM Package
    ORDER BY Weight DESC
    LIMIT 1
)
