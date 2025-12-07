SELECT s.student_id, s.bio_data, COUNT(c.class_id) AS course_count
FROM Students s
LEFT JOIN Classes c ON s.student_id = c.student_id
GROUP BY s.student_id, s.bio_data
ORDER BY s.student_id;
