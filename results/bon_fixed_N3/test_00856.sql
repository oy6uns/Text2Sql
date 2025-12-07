SELECT DISTINCT s1.name
FROM Sailors s1
WHERE EXISTS (
    SELECT 1
    FROM Sailors s2
    WHERE s2.rating > 7
      AND s1.age > s2.age
)
