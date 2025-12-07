SELECT s.bio_data
FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Student_Events se
    WHERE se.student_id = s.student_id
)
AND NOT EXISTS (
    SELECT 1
    FROM Student_Loans sl
    WHERE sl.student_id = s.student_id
)
