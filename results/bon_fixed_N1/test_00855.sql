SELECT DISTINCT s1.name
FROM Sailors s1
WHERE s1.age > ALL (
    SELECT s2.age
    FROM Sailors s2
    WHERE s2.rating > 7
)
