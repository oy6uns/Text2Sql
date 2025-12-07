SELECT 
  MAX(course_count) AS max_courses,
  student_id
FROM (
  SELECT 
    student_id,
    COUNT(class_id) AS course_count
  FROM Classes
  GROUP BY student_id
) sub
ORDER BY max_courses DESC
LIMIT 1;
