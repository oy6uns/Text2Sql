SELECT COUNT(DISTINCT c.teacher_id)
FROM Classes c
JOIN Students s ON c.student_id = s.student_id
LEFT JOIN Achievements a ON s.student_id = a.student_id
WHERE a.achievement_id IS NULL;
