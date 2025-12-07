SELECT COUNT(DISTINCT c.teacher_id)
FROM Classes c
WHERE c.student_id IN (
    SELECT s.student_id
    FROM Students s
    LEFT JOIN Achievements a ON s.student_id = a.student_id
    GROUP BY s.student_id
    HAVING COUNT(a.achievement_id) = 0
)
