SELECT t.date_of_transcript
FROM Transcripts t
JOIN (
    SELECT student_id
    FROM Student_Loans
    GROUP BY student_id
    ORDER BY SUM(amount_of_loan) DESC
    LIMIT 1
) l ON t.student_id = l.student_id
ORDER BY t.date_of_transcript DESC
LIMIT 1;
