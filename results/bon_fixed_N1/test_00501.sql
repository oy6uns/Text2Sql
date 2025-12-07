SELECT student_id, COALESCE(SUM(amount_of_loan), 0) AS total_loan_amount
FROM Student_Loans
GROUP BY student_id;
