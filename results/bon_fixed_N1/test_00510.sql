SELECT s.bio_data
FROM Students s
WHERE s.student_id IN (SELECT DISTINCT se.student_id FROM Student_Events se)
  AND s.student_id NOT IN (SELECT DISTINCT sl.student_id FROM Student_Loans sl)
