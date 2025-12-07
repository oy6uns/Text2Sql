SELECT t.date_of_transcript
FROM Transcripts t
JOIN (
    SELECT student_id
    FROM Student_Loans
    ORDER BY amount_of_loan DESC
    LIMIT 1
) sl_max ON t.student_id = sl_max.student_id;
