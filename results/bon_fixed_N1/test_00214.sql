SELECT Assessment
FROM Student_Assessments
GROUP BY Assessment
ORDER BY COUNT(*) ASC
LIMIT 1;
