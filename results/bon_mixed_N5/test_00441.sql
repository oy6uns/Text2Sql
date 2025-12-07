SELECT s.student_id, s.bio_data
FROM Students s
JOIN (
    SELECT student_id
    FROM Classes
    GROUP BY student_id
    HAVING COUNT(*) >= 2
) c ON s.student_id = c.student_id
LEFT JOIN (
    SELECT student_id, COUNT(*) AS detention_count
    FROM Detention
    GROUP BY student_id
) d ON s.student_id = d.student_id
WHERE COALESCE(d.detention_count, 0) < 2;
