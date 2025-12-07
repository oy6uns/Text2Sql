SELECT Nationality
FROM member
GROUP BY Nationality
HAVING COUNT(*) >= 2;
