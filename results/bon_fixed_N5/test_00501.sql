SELECT student_id, SUM(amount_of_loan) AS total_loan_amount
FROM Student_Loans
GROUP BY student_id;
