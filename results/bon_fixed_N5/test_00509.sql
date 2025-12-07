SELECT DISTINCT s.bio_data
FROM Students s
JOIN Student_Events se ON s.student_id = se.student_id
LEFT JOIN Student_Loans sl ON s.student_id = sl.student_id
WHERE sl.student_loan_id IS NULL;
