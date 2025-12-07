SELECT behaviour_monitoring_details, COUNT(*) AS count
FROM Behaviour_Monitoring
GROUP BY behaviour_monitoring_details
ORDER BY count DESC
LIMIT 1;
