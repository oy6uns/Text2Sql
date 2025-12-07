SELECT Home_Conference, AVG(Enrollment) AS Average_Enrollment
FROM university
GROUP BY Home_Conference
HAVING AVG(Enrollment) > 2000;
