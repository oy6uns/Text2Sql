SELECT DISTINCT t.teacher_details
FROM Teachers t
JOIN Classes c ON t.teacher_id = c.teacher_id
JOIN (
    SELECT student_id
    FROM Transcripts
    ORDER BY date_of_transcript
    LIMIT 1
) earliest_student ON c.student_id = earliest_student.student_id;
