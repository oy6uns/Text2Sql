SELECT s.bio_data, s.student_details
FROM Students s
JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id
WHERE bm.behaviour_monitoring_details IN (
    SELECT behaviour_monitoring_details
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
    HAVING COUNT(DISTINCT student_id) = 3
)
AND s.student_id IN (
    SELECT student_id
    FROM Transcripts
    WHERE transcript_details = (
        SELECT transcript_details
        FROM Transcripts
        GROUP BY transcript_details
        ORDER BY COUNT(DISTINCT student_id) DESC
        LIMIT 1
    )
);
