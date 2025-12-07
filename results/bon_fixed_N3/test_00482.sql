SELECT Teachers.teacher_details, Students.student_details
FROM Classes
JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id
JOIN Students ON Classes.student_id = Students.student_id;
