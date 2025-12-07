WITH Most_Common_Results AS (
    SELECT behaviour_monitoring_details, COUNT(DISTINCT student_id) AS student_count
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
    ORDER BY student_count DESC
    LIMIT 1
),
Results_With_Three_Students AS (
    SELECT behaviour_monitoring_details
    FROM Behaviour_Monitoring
    GROUP BY behaviour_monitoring_details
    HAVING COUNT(DISTINCT student_id) = 3
),
Students_With_Both_Results AS (
    SELECT bm1.student_id
    FROM Behaviour_Monitoring bm1
    JOIN Most_Common_Results mcr ON bm1.behaviour_monitoring_details = mcr.behaviour_monitoring_details
    JOIN Behaviour_Monitoring bm2 ON bm1.student_id = bm2.student_id
    JOIN Results_With_Three_Students rws ON bm2.behaviour_monitoring_details = rws.behaviour_monitoring_details
    GROUP BY bm1.student_id
)
SELECT s.bio_data, s.student_details
FROM Students s
WHERE s.student_id IN (SELECT student_id FROM Students_With_Both_Results);
