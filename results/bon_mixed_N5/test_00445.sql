SELECT s.bio_data
FROM Students s
LEFT JOIN Detention d ON s.student_id = d.student_id
LEFT JOIN Student_Loans sl ON s.student_id = sl.student_id
WHERE d.detention_id IS NULL
  AND sl.student_loan_id IS NULL;
