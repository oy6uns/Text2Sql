SELECT s.bio_data
FROM Students s
JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id
GROUP BY s.student_id, s.bio_data
HAVING COUNT(DISTINCT bm.behaviour_monitoring_details) = 1
   AND bm.behaviour_monitoring_details = (
       SELECT bm2.behaviour_monitoring_details
       FROM Behaviour_Monitoring bm2
       GROUP BY bm2.behaviour_monitoring_details
       ORDER BY COUNT(*) DESC
       LIMIT 1
   )
