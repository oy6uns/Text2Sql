SELECT s.student_id, s.student_details
FROM Students s
JOIN Classes c ON s.student_id = c.student_id
GROUP BY s.student_id, s.student_details
HAVING COUNT(c.class_id) = 2;
