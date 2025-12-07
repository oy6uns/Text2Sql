SELECT SUM(Enrollment) AS Total_Enrollment
FROM institution
WHERE City IN ('Vancouver', 'Calgary');
