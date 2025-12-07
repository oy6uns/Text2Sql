SELECT SUM(Enrollment) AS total_enrollment
FROM institution
WHERE City IN ('Vancouver', 'Calgary')
