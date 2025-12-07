SELECT Assessment, COUNT(*) AS Assessment_Count
FROM Student_Assessments
GROUP BY Assessment
ORDER BY Assessment_Count ASC
LIMIT 1;
