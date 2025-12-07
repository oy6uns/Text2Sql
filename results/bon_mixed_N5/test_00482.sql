SELECT t.teacher_details, s.bio_data
FROM Classes c
JOIN Teachers t ON c.teacher_id = t.teacher_id
JOIN Students s ON c.student_id = s.student_id;
