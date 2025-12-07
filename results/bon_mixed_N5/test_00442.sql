SELECT s.student_id, s.bio_data
FROM Students s
LEFT JOIN (
    SELECT student_id, COUNT(*) AS class_count
    FROM Classes
    GROUP BY student_id
) c ON s.student_id = c.student_id
LEFT JOIN (
    SELECT student_id, COUNT(*) AS detention_count
    FROM Detention
    GROUP BY student_id
) d ON s.student_id = d.student_id
WHERE COALESCE(c.class_count, 0) >= 2 OR COALESCE(d.detention_count, 0) < 2;
