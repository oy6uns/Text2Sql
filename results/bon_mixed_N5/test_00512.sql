SELECT sa.date_from, sa.date_to
FROM Students_Addresses sa
JOIN (
    SELECT student_id
    FROM Transcripts
    GROUP BY student_id
    HAVING COUNT(*) = 2
) t ON sa.student_id = t.student_id;
