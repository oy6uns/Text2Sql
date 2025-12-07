SELECT DISTINCT m1.Nationality
FROM member m1
WHERE m1.Age > 22
AND EXISTS (
    SELECT 1
    FROM member m2
    WHERE m2.Nationality = m1.Nationality
    AND m2.Age < 19
)
