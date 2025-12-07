SELECT student_id, COUNT(class_id) AS number_of_courses
FROM Classes
GROUP BY student_id
ORDER BY number_of_courses DESC
LIMIT 1;
