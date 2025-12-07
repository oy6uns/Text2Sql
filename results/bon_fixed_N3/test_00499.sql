SELECT DISTINCT t.teacher_details
FROM Students s
JOIN Transcripts tr ON s.student_id = tr.student_id
JOIN Classes c ON s.student_id = c.student_id
JOIN Teachers t ON c.teacher_id = t.teacher_id
WHERE tr.date_of_transcript = (
    SELECT MIN(date_of_transcript) FROM Transcripts
)
