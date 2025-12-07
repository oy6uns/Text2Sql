SELECT State
FROM university
WHERE Enrollment < 3000
GROUP BY State
HAVING COUNT(University_ID) > 2;
