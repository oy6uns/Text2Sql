SELECT Nationality
FROM member
GROUP BY Nationality
HAVING COUNT(Member_ID) >= 2;
