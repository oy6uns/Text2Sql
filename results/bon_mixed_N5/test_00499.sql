SELECT DISTINCT t.teacher_details
FROM Teachers t
JOIN Classes c ON t.teacher_id = c.teacher_id
JOIN Students s ON c.student_id = s.student_id
JOIN Transcripts tr ON s.student_id = tr.student_id
WHERE s.student_id = (
    SELECT student_id
    FROM Transcripts
    ORDER BY date_of_transcript ASC
    LIMIT 1
)
