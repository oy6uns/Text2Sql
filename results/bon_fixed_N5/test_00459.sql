SELECT behaviour_monitoring_details, COUNT(*) AS student_count
FROM Behaviour_Monitoring
GROUP BY behaviour_monitoring_details
ORDER BY student_count DESC
LIMIT 1;
