SELECT teacher_id, COUNT(DISTINCT class_id) AS course_count
FROM Classes
GROUP BY teacher_id
ORDER BY course_count DESC
LIMIT 1;
