SELECT Home_Conference
FROM university
GROUP BY Home_Conference
ORDER BY SUM(Enrollment) ASC
LIMIT 1;
