SELECT DISTINCT t.teacher_id, t.teacher_details
FROM Teachers t
JOIN Classes c ON t.teacher_id = c.teacher_id
WHERE LOWER(c.class_details) LIKE '%data%'
  AND t.teacher_id NOT IN (
    SELECT teacher_id
    FROM Classes
    WHERE LOWER(class_details) LIKE 'net%'
  )
