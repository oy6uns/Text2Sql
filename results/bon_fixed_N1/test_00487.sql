SELECT student_id, student_details
FROM Classes
GROUP BY student_id, student_details
HAVING COUNT(DISTINCT class_id) = 2;
