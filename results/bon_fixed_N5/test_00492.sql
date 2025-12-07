SELECT s.bio_data, s.student_details
FROM Students s
JOIN Student_Loans sl ON s.student_id = sl.student_id
WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
