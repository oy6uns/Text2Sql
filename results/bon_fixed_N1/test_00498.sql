SELECT date_of_loan AS transcript_issuance_date
FROM Student_Loans
WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans)
LIMIT 1;
