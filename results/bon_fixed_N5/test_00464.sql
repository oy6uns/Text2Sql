SELECT bio_data
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Behaviour_Monitoring
    WHERE behaviour_monitoring_details = (
        SELECT behaviour_monitoring_details
        FROM Behaviour_Monitoring
        GROUP BY behaviour_monitoring_details
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
);
