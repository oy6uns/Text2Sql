SELECT behaviour_monitoring_details, COUNT(DISTINCT student_id) AS number_of_students
FROM Behaviour_Monitoring
GROUP BY behaviour_monitoring_details
HAVING COUNT(*) = (
    SELECT MAX(counts) FROM (
        SELECT COUNT(*) AS counts
        FROM Behaviour_Monitoring
        GROUP BY behaviour_monitoring_details
    ) sub
)
