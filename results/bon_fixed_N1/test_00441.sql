SELECT s.student_id, s.bio_data
FROM Students s
LEFT JOIN Classes c ON s.student_id = c.student_id
LEFT JOIN Detention d ON s.student_id = d.student_id
GROUP BY s.student_id, s.bio_data
HAVING COUNT(DISTINCT c.class_id) >= 2
   AND COUNT(DISTINCT d.detention_id) < 2;
