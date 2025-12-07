SELECT Home_Conference
FROM university
GROUP BY Home_Conference
HAVING SUM(Enrollment) = (
    SELECT MIN(total_enrollment)
    FROM (
        SELECT SUM(Enrollment) AS total_enrollment
        FROM university
        GROUP BY Home_Conference
    ) sub
)
