SELECT 
    Classes.teacher_id,
    Teachers.teacher_details,
    Classes.student_id,
    Students.bio_data,
    Students.student_details,
    Classes.class_details
FROM 
    Classes
JOIN 
    Teachers ON Classes.teacher_id = Teachers.teacher_id
JOIN 
    Students ON Classes.student_id = Students.student_id;
