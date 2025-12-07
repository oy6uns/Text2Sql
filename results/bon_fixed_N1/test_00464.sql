SELECT s.bio_data
FROM Students s
JOIN Behaviour_Monitoring b ON s.student_id = b.student_id
WHERE b.behaviour_monitoring_details = (
    SELECT behaviour_monitoring_details
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
