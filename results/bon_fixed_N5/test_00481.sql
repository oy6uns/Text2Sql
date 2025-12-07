SELECT 
    t.teacher_id,
    t.teacher_details,
    s.student_id,
    s.bio_data,
    s.student_details,
    c.class_id,
    c.class_details
FROM 
    Classes c
JOIN 
    Teachers t ON c.teacher_id = t.teacher_id
JOIN 
    Students s ON c.student_id = s.student_id;
