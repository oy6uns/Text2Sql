SELECT Assessment, COUNT(*) AS assessment_count
FROM Student_Assessments
GROUP BY Assessment
ORDER BY assessment_count ASC
LIMIT 1;
