SELECT date_of_loan, date_of_transcript
FROM Student_Loans sl
JOIN Transcripts t ON sl.student_id = t.student_id
WHERE sl.amount_of_loan = (
    SELECT MAX(amount_of_loan)
    FROM Student_Loans
)
ORDER BY date_of_loan DESC
LIMIT 1;
