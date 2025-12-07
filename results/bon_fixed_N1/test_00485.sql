SELECT student_id, COUNT(class_id) AS course_count
FROM Classes
GROUP BY student_id
ORDER BY course_count DESC
LIMIT 1;
