SELECT T.date_of_transcript
FROM Transcripts T
JOIN (
    SELECT student_id
    FROM Student_Loans
    GROUP BY student_id
    ORDER BY SUM(amount_of_loan) DESC
    LIMIT 1
) SL ON T.student_id = SL.student_id;
