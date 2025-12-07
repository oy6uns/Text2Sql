SELECT DISTINCT m1.Nationality
FROM member m1
JOIN member m2 ON m1.Nationality = m2.Nationality
WHERE m1.Age > 22 AND m2.Age < 19;
