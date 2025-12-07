SELECT bio_data
FROM Students s
WHERE NOT EXISTS (
    SELECT 1 FROM Detention d WHERE d.student_id = s.student_id
)
AND NOT EXISTS (
    SELECT 1 FROM Student_Loans sl WHERE sl.student_id = s.student_id
)
