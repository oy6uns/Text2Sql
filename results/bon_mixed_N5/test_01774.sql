SELECT Home_Conference
FROM university
GROUP BY Home_Conference
HAVING AVG(Enrollment) > 2000;
