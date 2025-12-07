SELECT teacher_id, COUNT(class_id) AS number_of_courses
FROM Classes
GROUP BY teacher_id
ORDER BY number_of_courses DESC
LIMIT 1;
