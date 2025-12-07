SELECT s.bio_data, s.student_details
FROM Students s
JOIN (
    SELECT bm.student_id
    FROM Behaviour_Monitoring bm
    JOIN (
        SELECT transcript_details
        FROM Transcripts
        GROUP BY transcript_details
        ORDER BY COUNT(*) DESC
        LIMIT 1
    ) mc ON bm.behaviour_monitoring_details = mc.transcript_details
    GROUP BY bm.student_id
    HAVING COUNT(*) = 3
) bms ON s.student_id = bms.student_id;
