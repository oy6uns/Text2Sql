SELECT name
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
    GROUP BY sid
    HAVING COUNT(DISTINCT bid) >= 2
)
